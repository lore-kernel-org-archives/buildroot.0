From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:50:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib: simplify
 version checks
In-Reply-To: <20200827172140.137791-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 Aug 2020 19:21:40 +0200")
References: <20200827172140.137791-1-fontaine.fabrice@gmail.com>
Message-ID: <873646oe1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Hopefully, this should fix the following error on one of the
 > autobuilders:

 > png: no  [The C/C++ header for libpng (png.h) could not
 >      be found.  You may need to install the development
 >      package.]

 > Fixes:
 >  - http://autobuild.buildroot.org/results/afddcc44b2fb7983244f24542bfae921869e4ab8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
