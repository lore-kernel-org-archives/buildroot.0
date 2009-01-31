From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 23:03:10 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91rm9200df at91sam9260dfc at91sam9261e etc...
In-Reply-To: <20090131214405.4A8147621A@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 31 Jan 2009 21\:44\:05 +0000 \(UTC\)")
References: <20090131214405.4A8147621A@busybox.osuosl.org>
Message-ID: <87k58bjfq9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-31 21:44:04 +0000 (Sat, 31 Jan 2009)
 ulf> New Revision: 25199

 ulf> Log:
 ulf> Add AT91 defconfigs for binary toolchains

 ulf> Added:

 ulf>    trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig

I'm really not convinced we need (to keep updated) all those
defconfigs.

-- 
Bye, Peter Korsgaard
