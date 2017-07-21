From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 21 Jul 2017 16:07:23 +0200
Subject: [Buildroot] [PATCH] package/openal: bump version to 1.18.0
In-Reply-To: <20170721155528.018481e1@windsurf>
References: <1500644031-25581-1-git-send-email-nerv@dawncrow.de>
 <20170721155528.018481e1@windsurf>
Message-ID: <6c493237-ef86-7f7b-2fbd-7bf014ffda30@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.07.2017 um 15:55 schrieb Thomas Petazzoni:
> Hello,
> 
> On Fri, 21 Jul 2017 15:33:51 +0200, Andr? Hentschel wrote:
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  .../0001-Build-NEON-code-with-mfpu-neon.patch      | 29 ----------
>>  ...heck-for-run-time-NEON-support-by-reading.patch | 67 ----------------------
>>  ...003-Properly-check-if-proc-cpuinfo-opened.patch | 24 --------
>>  ...k-if-mfpu-neon-is-available-for-compiling.patch | 47 ---------------
>>  .../openal/0005-Fix-detection-of-C11-atomics.patch | 53 -----------------
> 
> When you drop patches, it's nice to have a slightly more descriptive
> commit log that says why those patches are dropped. For some of them,
> it's quite obvious, since they were backports from upstream commits
> (0001, 0002, 0003 and 0004), but for some others, it's not really
> obvious (patch 0005).
> 
> Is the patch 0005 now upstream and part of 1.18.0 ?

Hi,

yes it is: https://github.com/kcat/openal-soft/blob/master/CMakeLists.txt#L211

Thx!
