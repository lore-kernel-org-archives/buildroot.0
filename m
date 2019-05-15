From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 May 2019 14:20:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: fix build
 on m68k_cf
In-Reply-To: <20190514170213.21811-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 14 May 2019 19:02:13 +0200")
References: <20190514170213.21811-1-fontaine.fabrice@gmail.com>
Message-ID: <87y3373o4o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > An internal compiler error is raised on m68k_cf at dwarf2cfi.c:2802 in
 > connect_traces. Error can be fixed by adding -fno-defer-pop, see
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864

 > Fixes:
 >  - http://autobuild.buildroot.org/results/746f60fadb40288341c1e5642cfcf6373b70583a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
