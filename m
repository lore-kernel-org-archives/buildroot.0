From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 16:26:04 -0500
Subject: [Buildroot] [PATCH v5 02/24] sqlite: Add host build support
In-Reply-To: <20150518231733.727c332a@free-electrons.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-3-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150518231733.727c332a@free-electrons.com>
Message-ID: <CANn-YGTy3sEr4FK_JA7yy03P2tzu9SdPTXXVZA57NCbZNnMRRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 18, 2015 at 4:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Wed, 13 May 2015 16:39:15 -0500, Clayton Shotwell wrote:
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
>> index fff219a..aaf84fc 100644
>> --- a/package/sqlite/sqlite.mk
>> +++ b/package/sqlite/sqlite.mk
>> @@ -50,3 +50,4 @@ SQLITE_CONF_OPTS += --disable-readline
>>  endif
>>
>>  $(eval $(autotools-package))
>> +$(eval $(host-autotools-package))
>
> When adding a host package, it's always good to indicate which other
> package will be using it so that it doesn't seem to be a useless change.

I can add a comment to the commit stating why the host support is being added.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
