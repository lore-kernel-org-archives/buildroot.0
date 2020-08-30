From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Aug 2020 13:06:01 +0300
Subject: [Buildroot] [PATCH 1/1] package/libraw: drop unrecognized
 options
In-Reply-To: <20200828001128.2e8e5cb0@windsurf.home>
References: <20200827213657.257570-1-fontaine.fabrice@gmail.com>
 <20200828001128.2e8e5cb0@windsurf.home>
Message-ID: <87zh6c78ja.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Aug 28 2020, Thomas Petazzoni wrote:
> On Thu, 27 Aug 2020 23:36:57 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
>> demosaic packs have been removed since version 0.19.0 and
>> https://github.com/LibRaw/LibRaw/commit/b85690eb4881d613dd48068ee82f98ac246690b8
>> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/libraw/libraw.mk | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> Applied to master, thanks.

This patch is not is master as of commit 689fe66100b14
("package/uclibc: use HOSTCC_NOCCACHE as kconfig HOSTCC").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
