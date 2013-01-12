From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:42:06 +0100
Subject: [Buildroot] [PATCH 15/28] docker: depend on xlib_libX11 and not
	the X.org server
In-Reply-To: <3c27991f0c7b1542999f41169a8d968f33c84768.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:27 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <3c27991f0c7b1542999f41169a8d968f33c84768.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pq1a2i4x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> docker is a X client application, so it doesn't make sense to depend
 Thomas> on the X.org server. An inspection of docker Makefile and source code
 Thomas> shows that it only needs the libX11 library, so we replace the X.org
 Thomas> server dependency by a libX11 dependency.

Committed, thanks.

-- 
Bye, Peter Korsgaard
