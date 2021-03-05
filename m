From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 13:23:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/elfutils: link with libatomic
 if needed
In-Reply-To: <20210221202944.121423-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Feb 2021 21:29:44 +0100")
References: <20210221202944.121423-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0qlg57a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of elfutils 0.181 with Bootlin SPARC uclibc toolchain added
 > with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

 > Fixes:
 >  - http://autobuild.buildroot.org/results/31ce9e3861c6229a7869a15d322f5d2f5bfc6165

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
