From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:04:19 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
In-Reply-To: <bmga5fxcsc.ln2@ID-313208.user.individual.net>
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
 <20180825230514.1f0264dd@windsurf>
 <o5u85fxpst.ln2@ID-313208.user.individual.net>
 <20180825233958.29369922@windsurf>
 <bmga5fxcsc.ln2@ID-313208.user.individual.net>
Message-ID: <20180827110419.126067bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Aug 2018 13:48:59 +0200, Bernd Kuhls wrote:

> > So it still needs some atomic intrinsics, so the package should:
> > 
> > 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_4  
> 
> Hi Thomas,
> 
> why "BR2_TOOLCHAIN_HAS_SYNC_4" and not "BR2_TOOLCHAIN_HAS_SYNC_8"?

I misread the error message you pasted. Indeed it should be
BR2_TOOLCHAIN_HAS_SYNC_8. Sorry about that :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
