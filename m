From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 Dec 2014 14:30:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/musl: fix C library
	installation directory
In-Reply-To: <1418089476-15360-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 9 Dec 2014 02:44:35 +0100")
References: <1418089476-15360-1-git-send-email-jkrause@posteo.de>
Message-ID: <87vbllrlwk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Set the installation path for the libraries to /lib instead of /usr/lib.
 > This fixes an issue when building a toolchain with the musl library by
 > the internal toolchain backend of Buildroot in the first step and import this
 > toolchain later as a custom external toolchain in a second step. For this use
 > case check-musl in toolchain/helpers.mk failed because it did not find the 
 > libc or libm in sysroot/lib.

 > This patch superseeds: [PATCH 1/1] toolchain/helpers.mk: fix check-musl
 > http://patchwork.ozlabs.org/patch/417587/

> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
