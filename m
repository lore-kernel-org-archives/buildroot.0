From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 6 Oct 2020 23:14:54 +0000
Subject: [Buildroot] [PATCH v2 5/6] package/uclibc: fix compilation
 errors
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-6-damien.lemoal@wdc.com>
 <20201006234919.7eb7e2e1@windsurf.home>
Message-ID: <CY4PR04MB3751721039AB61D8297A7326E70D0@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/10/07 6:49, Thomas Petazzoni wrote:
> On Tue,  8 Sep 2020 20:33:23 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>> Add four patches to fix compilation errors when building static no MMU
>> uclibc. The first two patches are upstream uclibc patches on top of
>> version 1.0.35 tag. The following two patches are added here as
>> additional fixes.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  ...evert-Fix-static-linking-with-GCC-10.patch |  43 ++++++++
>>  ...0002-fix-static-builds-with-gcc-10.x.patch |  25 +++++
>>  ...-utils-getconf-Fix-compilation-error.patch | 103 ++++++++++++++++++
>>  .../0004-librt-avoid-compilation-error.patch  |  42 +++++++
>>  4 files changed, 213 insertions(+)
>>  create mode 100644 package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
>>  create mode 100644 package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
>>  create mode 100644 package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
>>  create mode 100644 package/uclibc/0004-librt-avoid-compilation-error.patch
> 
> I believe all of those patches are upstream as of uclibc-ng 1.0.35, so
> I've marked this patch as Rejected.

Yes, they were all accepted. Thanks !

> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
