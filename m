From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:05:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xload: disable
 gettext detection when not needed
In-Reply-To: <20201204205052.1404782-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 4 Dec 2020 21:50:52 +0100")
References: <20201204205052.1404782-1-bernd.kuhls@t-online.de>
Message-ID: <87eeiz59bc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Patch originates from FreeBSD:
 > https://lists.freebsd.org/pipermail/freebsd-x11/2015-July/016528.html
 > https://svnweb.freebsd.org/ports/head/x11/libXpm/Makefile?r1=384234&r2=391122&pathrev=391122

 > Fixes:
 > http://autobuild.buildroot.net/results/2ad/2ad27875ce5c16a111d54d452eb395257e9b5e2b/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > xlib_libXpm was fixed the same way:
 > http://patchwork.ozlabs.org/project/buildroot/patch/20180107175626.19944-1-bernd.kuhls at t-online.de/

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
