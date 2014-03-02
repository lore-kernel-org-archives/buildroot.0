From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Mar 2014 15:14:43 +0100
Subject: [Buildroot] [PATCH] manual: clarify
	Tested-by/Reviewed-by/Acked-by tags
In-Reply-To: <CAHXCMMLizfSnwrM2HL18Mb0YZvFjo=ZDMOoV_PZEcXn6gnKAMg@mail.gmail.com>
References: <bce317fee03f949a279a.1393765156@argentina>
 <CAHXCMMLizfSnwrM2HL18Mb0YZvFjo=ZDMOoV_PZEcXn6gnKAMg@mail.gmail.com>
Message-ID: <afccb1bb-5e2f-4569-86b1-d0a37977bf35@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> schreef:
>Hi Thomas,
>
>On Sun, Mar 2, 2014 at 1:59 PM, Thomas De Schampheleire
><patrickdepinguin@gmail.com> wrote:
>> This patch updates the manual with more clarified descriptions of tags
>> Tested-by, Reviewed-by, and Acked-by, as discussed on the Buildroot
>> developer days in February 2014.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>  docs/manual/contribute.txt |  43 +++++++++++++++++++++++++++++++++++++++--
>>  1 files changed, 40 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
>> --- a/docs/manual/contribute.txt
>> +++ b/docs/manual/contribute.txt
>> @@ -145,10 +145,47 @@ submissions.
>>  Some tags are used to help following the state of any patch posted on
>>  the mailing-list:
>>
>> -Acked-by:: Indicates that the patch can be committed.
>> +Tested-by:: Indicates that the patch has been tested in one way or
>> +  another. You are encouraged to specify what kind of testing you
>> +  performed (compile-test on architecture X and Y, runtime test on
>> +  target A, ...). This additional information helps other testers and
>> +  the maintainer.
>>
>> -Tested-by:: Indicates that the patch has been tested. It is useful
>> -  but not necessary to add a comment about what has been tested.
>> +Reviewed-by:: Indicates that you code-reviewed the patch and did your
>> +  best in spotting problems, but you are not sufficiently familiar with
>> +  the area touched to provide an Acked-by tag. This means that there
>> +  may be remaining problems in the patch that would be spotted by
>> +  someone with more experience in that area. Should such problems be
>> +  detected, your Reviewed-by tag remains appropriate and you cannot
>> +  be blamed.
>> +
>> +Acked-by:: Indicates that you code-reviewed the patch and you are
>> +familiar enough with the area touched to feel that the patch can be
>> +committed as-is (no additional changes required). In case it later turns
>> +out that something is wrong with the patch, your Acked-by could be
>> +considered inappropriate. The difference between Acked-by and Tested-by
>> +is thus mainly that you are prepared to take the blame on Acked patches,
>> +but not on Reviewed ones.
>
>Here, you mean "The difference between Acked-by and Reviewed-by ...", no?
>Otherwise, the last sentence of this paragraph does not really make sense to me.

Ah yes, that's a mistake, thanks. I'll send a v2. 
