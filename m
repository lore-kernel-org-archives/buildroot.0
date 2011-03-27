From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Mar 2011 22:51:26 +0200
Subject: [Buildroot] [PATCH 1/1] qt: disable isascii calls when undefined
In-Reply-To: <1300920852-21189-1-git-send-email-s.martin49@gmail.com> (Samuel
	Martin's message of "Wed, 23 Mar 2011 23:54:12 +0100")
References: <1300920852-21189-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87oc4wmgmp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Out of interest, on what kind of setup don't you have isascii()? Have
you sent this patch upstream to the qt people?

-- 
Bye, Peter Korsgaard
