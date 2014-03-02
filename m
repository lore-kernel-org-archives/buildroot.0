From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Mar 2014 14:04:48 +0100
Subject: [Buildroot] [PATCH 06/11] armadillo: new package
In-Reply-To: <CAHXCMM+RUEfk31FiRUOdNdCU_CcEV1rEg8HWquUc+M7KXWJmkg@mail.gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-7-git-send-email-s.martin49@gmail.com>
 <CAHXCMM+RUEfk31FiRUOdNdCU_CcEV1rEg8HWquUc+M7KXWJmkg@mail.gmail.com>
Message-ID: <3481095e-bd0e-4536-9442-fdd9bd249a17@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> schreef:
>Hi all,
>
>On Sun, Feb 16, 2014 at 10:59 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Armadillo is a C++ linear algebra library.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/Config.in              |  1 +
>>  package/armadillo/Config.in    |  9 +++++++++
>>  package/armadillo/armadillo.mk | 15 +++++++++++++++
>>  3 files changed, 25 insertions(+)
>>  create mode 100644 package/armadillo/Config.in
>>  create mode 100644 package/armadillo/armadillo.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index d843961..5c3226e 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -723,6 +723,7 @@ source "package/zyre/Config.in"
>>  endmenu
>>
>>  menu "Other"
>> +source "package/armadillo/Config.in"
>>  source "package/apr/Config.in"

Alphabetical order is not correct here.

>>  source "package/apr-util/Config.in"
>>  source "package/argp-standalone/Config.in"

Best regards,
Thomas
