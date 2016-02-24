From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:46:00 +0100
Subject: [Buildroot] [PATCH 0/9] Olimex A20 OlinuXino updates
In-Reply-To: <CAB0FRsufz4DCdX9fT2axV-TjTEgxifus8EExibNXJYyKE97RXQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Tue, 23 Feb 2016
 18:59:55 +0100")
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
 <CAB0FRsufz4DCdX9fT2axV-TjTEgxifus8EExibNXJYyKE97RXQ@mail.gmail.com>
Message-ID: <87oab5ybfb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 > another cleanup, in configs/olimex_a20_olinuxino_lime2_defconfig these
 > 3 lines could be removed:
 > BR2_PACKAGE_SUNXI_TOOLS=y
 > BR2_PACKAGE_SUNXI_BOARDS=y
 > BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_lime.fex"

 > there are only needed with a linux-sunxi kernel, like in
 > configs/olimex_a20_olinuxino_lime_mali_defconfig

Indeed. Care to send a patch to do this?

-- 
Bye, Peter Korsgaard
