From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:42:35 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
In-Reply-To: <20081220221752.72EE276CEB@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 20 Dec 2008 22\:17\:52 +0000 \(UTC\)")
References: <20081220221752.72EE276CEB@busybox.osuosl.org>
Message-ID: <877i5r8bxw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

Hi,

 ulf> Author: ulf
 ulf> Date: 2008-12-20 22:17:52 +0000 (Sat, 20 Dec 2008)
 ulf> New Revision: 24468

 ulf> Log:
 ulf> Hide AT91 features if not an AT91 ARM

 ulf> Modified:
 ulf>    trunk/buildroot/target/device/Atmel/AT91_Config.in

 ulf>  	  Atmel AT91 ARM based systems
 
 ulf>  comment	"Selection criteria"
 ulf> +	depends on BR2_TARGET_AT91

Why not wrap it all in if BR2_TARGET_AT91 instead?

-- 
Bye, Peter Korsgaard
