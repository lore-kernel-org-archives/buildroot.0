From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Oct 2011 14:41:40 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: fix ccache dependencies order
In-Reply-To: <1319395872-9051-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 23 Oct 2011 20:51:12 +0200")
References: <1319395872-9051-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87k47pqoe3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> avoid gawk complaining when running 'make ctng-menuconfig' in a
 Samuel> clean/distclean tree in which ccache and crosstool-ng are enabled

Committed, thanks.

-- 
Bye, Peter Korsgaard
