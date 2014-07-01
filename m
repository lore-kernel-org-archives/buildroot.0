From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2014 15:12:08 +0200
Subject: [Buildroot] [PATCH] pwgen: add host utilities menu entry
In-Reply-To: <1404214923-27568-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 1 Jul 2014 08:42:03 -0300")
References: <1404214923-27568-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqbxfck7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in.host       | 1 +
 >  package/pwgen/Config.in.host | 7 +++++++
 >  2 files changed, 8 insertions(+)
 >  create mode 100644 package/pwgen/Config.in.host

 > diff --git a/package/Config.in.host b/package/Config.in.host
 > index 08b8064..dce1a2d 100644
 > --- a/package/Config.in.host
 > +++ b/package/Config.in.host
 > @@ -13,6 +13,7 @@ menu "Host utilities"
 >  	source "package/omap-u-boot-utils/Config.in.host"
 >  	source "package/openocd/Config.in.host"
 >  	source "package/parted/Config.in.host"
 > +	source "package/pwgen/Config.in.host"
 >  	source "package/qemu-system/Config.in.host"

Yes, I'll get to that some time ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
