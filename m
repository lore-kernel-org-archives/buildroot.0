From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Mar 2014 21:57:10 +0100
Subject: [Buildroot] [PATCH 4 of 8] manual: contributing: move section
 on patch reviews up and change intro
In-Reply-To: <20140305174127.GI5066@free.fr>
References: <patchbomb.1394036666@argentina>
 <a96a7201cce3dcfda3d5.1394036670@argentina>
 <20140305174127.GI5066@free.fr>
Message-ID: <CAHXCMM+F5a+QiFXyybyzntpa=6Crygw2=2m4OiysEQoW9wdAeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 5, 2014 at 6:41 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-03-05 17:24 +0100, Thomas De Schampheleire spake thusly:
>> This patch moves the section about patch reviews and the
>> Tested-by/Reviewed-by/Acked-by tags upwards. Additionally, the first
>> paragraph is removed and replaced by another one. There are no other changes
>> in the text.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  docs/manual/contribute.txt |  127 ++++++++++++++++++++--------------------
>>  1 files changed, 65 insertions(+), 62 deletions(-)
>>
>> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
>> --- a/docs/manual/contribute.txt
>> +++ b/docs/manual/contribute.txt
>> @@ -75,6 +75,71 @@ basically two things that can be done:
>>  Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
>>  ---------------------
>>
>> +Reviewing and testing patches
>> +-----------------------------
>> +
>> +With the amount of patches sent to the mailing list each day, the
>> +maintainer has a very hard job in judging which patches are ready to
>> +apply and which aren't. Contributors can greatly help here by reviewing
>> +and testing these patches, and providing the appropriate Tested-by,
>> +Reviewed-by, or Acked-by tags (see below).
>> +
>> +In the review process, do not hesitate to respond to patch submissions
>> +for remarks, suggestions or anything that will help everyone to
>> +understand the patches and make them better. Please use internet
>> +style replies in plain text emails when responding to patch
>> +submissions.
>> +
>> +Some tags are used to help following the state of any patch posted on
>> +the mailing-list:
>> +
>> +Tested-by:: Indicates that the patch has been tested in one way or
>> +  another. You are encouraged to specify what kind of testing you
>> +  performed (compile-test on architecture X and Y, runtime test on
>> +  target A, ...). This additional information helps other testers and
>> +  the maintainer.
>> +
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
>> +considered inappropriate. The difference between Acked-by and
>> +Reviewed-by is thus mainly that you are prepared to take the blame on
>> +Acked patches, but not on Reviewed ones.

A bit nitpicking:
for Tested-by/Reviewed-by the paragraph is indented, why not for Acked-by? ;-)
(well, it is not indented right now)

Regards,

-- 
Samuel
