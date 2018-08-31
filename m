From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 31 Aug 2018 06:23:30 +0300
Subject: [Buildroot] [PATCH/next] configs/pc: fix grub-efi.cfg
 permissions
In-Reply-To: <249674226.3791227.1535683915719.JavaMail.zimbra@datacom.com.br>
References: <20180831022412.2182-1-casantos@datacom.com.br>
 <249674226.3791227.1535683915719.JavaMail.zimbra@datacom.com.br>
Message-ID: <87tvnbw765.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Carlos Santos writes:
>> From: "DATACOM" <casantos@datacom.com.br>
>> To: "buildroot" <buildroot@buildroot.org>
>> Sent: Thursday, August 30, 2018 11:24:12 PM
>> Subject: [Buildroot] [PATCH/next] configs/pc: fix grub-efi.cfg permissions
>
>> It does not need the execute bits.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>> ---
>> board/pc/grub-efi.cfg | 0
>> 1 file changed, 0 insertions(+), 0 deletions(-)
>> mode change 100755 => 100644 board/pc/grub-efi.cfg
>> 
>> diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
>> old mode 100755
>> new mode 100644
>> --
>> 2.17.1
>
> I could not find this one on patchwork. Got lost?

There is a known issue with patchwork not catching rename or mode change
only patches.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
