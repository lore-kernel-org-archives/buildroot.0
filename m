From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 13:23:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: link with
 libatomic if needed
In-Reply-To: <20210221201452.103678-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Feb 2021 21:14:52 +0100")
References: <20210221201452.103678-1-fontaine.fabrice@gmail.com>
Message-ID: <87ft19g564.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of babeltrace2 in version 2.0.3 with Bootlin SPARC uclibc
 > toolchain added with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

 > Fixes:
 >  - http://autobuild.buildroot.org/results/31770bf70f9ce4e3be8fb310d084b214820c6829

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
