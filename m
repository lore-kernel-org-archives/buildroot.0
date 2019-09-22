From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Sep 2019 21:37:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: fix build without
 blkid
In-Reply-To: <CAPi7W82y_vepwQe8KrEKu=unRUeEhnhY5VKOriv_uaDTRRnqMQ@mail.gmail.com>
References: <20190922083559.589-1-fontaine.fabrice@gmail.com>
 <4fcb4ac2-7e52-4648-597f-3384d9134fe5@mind.be>
 <CAPi7W82y_vepwQe8KrEKu=unRUeEhnhY5VKOriv_uaDTRRnqMQ@mail.gmail.com>
Message-ID: <87v9tknpnq.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Sun, Sep 22 2019, Fabrice Fontaine wrote:
> Le dim. 22 sept. 2019 ? 20:17, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>> On 22/09/2019 10:35, Fabrice Fontaine wrote:
>> > Fixes:
>> >  - http://autobuild.buildroot.org/results/c126cb419709367479578b6f118ac9f0d6622689
>> >
>> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>
>>  Applied to master, thanks.
>>
>>  I assume you sent the patch upstream?
> Nope, I didn't find where to sent it.

Last year I sent a patch to the addresses listed in the F2FS entry of
the kernel's MAINTAINERS:

To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <yuchao0@huawei.com>
Cc: linux-f2fs-devel at lists.sourceforge.net

It was accepted as:

  https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=eefe225a566be9a4d9a176672c40df6585267d5f

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
