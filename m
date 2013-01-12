From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:43:08 +0100
Subject: [Buildroot] [PATCH 16/28] fltk: replace dependency on X.org
	server with dependency on libraries
In-Reply-To: <c98cbd466a25df945114fb0f6852c8c7ca973e78.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:28 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <c98cbd466a25df945114fb0f6852c8c7ca973e78.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87liby2i37.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> fltk is a X client library, so it doesn't make sense for it to depend
 Thomas> on the X.org server. Instead, it depends on libX11, libXext and libXt,
 Thomas> so we use those libraries as fltk dependencies.

Committed, thanks.

-- 
Bye, Peter Korsgaard
