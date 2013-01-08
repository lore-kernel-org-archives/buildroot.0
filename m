From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jan 2013 10:21:44 +0100
Subject: [Buildroot] [PATCH] linux: fix handle new dtb location since
	3.8-rc1 for appended dtbs
In-Reply-To: <1357634845-16507-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Tue, 8 Jan 2013 09:47:25 +0100")
References: <1357634845-16507-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87a9skav2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 Fabio> Remove a duplicated line to fix the following error:
 Fabio> linux/linux.mk:205: *** missing `endef', unterminated `define'.  Stop.

Yeah, I also just noticed it and fixed it up - Sorry about that.

-- 
Bye, Peter Korsgaard
