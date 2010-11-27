From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Nov 2010 21:41:58 +0100
Subject: [Buildroot] [PATCH 1/1] target-finalize: do not strip
	libthread_db
In-Reply-To: <1290796016-2136-2-git-send-email-javier.viguera@digi.com>
	(Javier Viguera's message of "Fri, 26 Nov 2010 19:26:56 +0100")
References: <1290796016-2136-1-git-send-email-javier.viguera@digi.com>
	<1290796016-2136-2-git-send-email-javier.viguera@digi.com>
Message-ID: <87tyj21otl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Javier" == Javier Viguera <javier.viguera@digi.com> writes:

 Javier> Fix previous commit not to strip libthread_db library. In the previous
 Javier> commit the wildcard was incorrectly matching the symbolic link instead
 Javier> of the real library file.

Committed, thanks.

-- 
Bye, Peter Korsgaard
