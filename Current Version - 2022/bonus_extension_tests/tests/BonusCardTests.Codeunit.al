codeunit 50100 "MNB Bonus Card Tests"
{
    Subtype = Test;

    var
        LibraryRandom: Codeunit "Library - Random";
        LibraryUtility: Codeunit "Library - Utility";
        Assert: Codeunit Assert;

    [Test]
    procedure CheckIfNotPossibleToChangeStartingDateInReleasedStatus()
    var
        BonusHeader: Record "MNB Bonus Header";
        StatusCannotBeReleasedErr: Label 'Status cannot be Released';
    begin
        // [SCENARIO] Check If Not Possible To Change Starting Date In Released Status
        // [GIVEN] Bouns Header exists in status Released 
        BonusHeader.Init();
        BonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        BonusHeader.Status := BonusHeader.Status::Released;
        BonusHeader.Insert();
        // [WHEN] Validate the Starting Date directly in the code
        asserterror BonusHeader.Validate("Starting Date", LibraryRandom.RandDate(10));
        // [THEN] Error is shown that you cannot change the Starting Date in Released status 
        Assert.ExpectedError(StatusCannotBeReleasedErr);
    end;

    [Test]
    procedure TestIfCustomerNoHaveValueBeforeRelease()
    var
        BonusHeader: Record "MNB Bonus Header";
        CustomerNoIsEmptyErr: Label 'Customer No. must have a value in Bonus: No.';
    begin
        // [SCENARIO] Test If Customer No. Have Value Before Release
        // [GIVEN] Bouns Header exists in status Open 
        BonusHeader.Init();
        BonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        BonusHeader.Status := BonusHeader.Status::Open;
        BonusHeader.Insert();
        // [WHEN] Change status to Released
        asserterror BonusHeader.Validate(Status, BonusHeader.Status::Released);
        // [THEN] Error is shown that Customer No. does not have value
        Assert.ExpectedError(CustomerNoIsEmptyErr);
    end;


}



