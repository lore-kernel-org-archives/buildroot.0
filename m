From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:23:23 +0100
Subject: [Buildroot] [PATCH 1/8] package/bitcoin: depends on
 !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
In-Reply-To: <20191208162725.2561301-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Dec 2019 17:27:18 +0100")
References: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv5syuro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Obviously, bitcoin depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735, not on
 > BR2_TOOLCHAIN_HAS_GCC_BUG_64735

 > Fixes:
 >  - No autobuilder failure

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed all 8 to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
