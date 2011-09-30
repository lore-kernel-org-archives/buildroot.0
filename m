From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Sep 2011 23:47:49 +0200
Subject: [Buildroot] [PATCH 1/2] gst-plugins-base: disable parallel build
In-Reply-To: <1317394114-3335-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Fri, 30 Sep 2011 16:48:33 +0200")
References: <1317394114-3335-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87y5x5n1mi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Parallel builds sometimes break when audio/testchannels is
 Sven> compiled before the gstinterfaces library.

Committed, thanks.

-- 
Bye, Peter Korsgaard
