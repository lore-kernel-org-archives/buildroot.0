From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:41:21 +0100
Subject: [Buildroot] [PATCH 14/28] cairo: always enable XCB support when
	X backend is enabled
In-Reply-To: <2b49f5dfdca60ca1ef60d3b62e05221ca96285b7.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:26 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <2b49f5dfdca60ca1ef60d3b62e05221ca96285b7.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87txqm2i66.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> cairo depends on xlib_libX11 for its Xlib backend. But xlib_libX11
 Thomas> depends on XCB, so the XCB support can always be built into Cairo.

Committed, thanks.

-- 
Bye, Peter Korsgaard
