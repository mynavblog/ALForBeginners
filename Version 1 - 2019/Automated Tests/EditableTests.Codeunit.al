codeunit 50140 "MNB Editable Tests"
{
    Subtype = Test;

    [Test]
    procedure CheckIfNotPossibleToChangeStartingDateInReleasedStatus()
    var
        MNBBonusHeader: Record "MNB Bonus Header";
    begin
        //[Scenario] Check If Not Possible To Change Starting Date In Released Status

        //[Given] Bouns Header Exists in status Released
        MNBBonusHeader.Init();
        MNBBonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        MNBBonusHeader.Status := MNBBonusHeader.Status::Released;
        MNBBonusHeader.Insert();

        //[When] Validate the Starting Date directly in the code
        asserterror MNBBonusHeader.Validate("Starting Date", LibraryRandom.RandDate(10));

        //[Then] Error is shown that you cannot change the Starting Date in Released status
        Assert.ExpectedError('Status must be equal to ''Open''');
    end;

    var
        LibraryUtility: Codeunit "Library - Utility";
        LibraryRandom: Codeunit "Library - Random";
        Assert: Codeunit Assert;
}