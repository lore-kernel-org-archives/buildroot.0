From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jun 2010 22:19:08 +0200
Subject: [Buildroot] [PATCH] qt: fix libQtMultimedia installation
In-Reply-To: <1275597062-8925-1-git-send-email-luca@lucaceresoli.net>
	(luca@lucaceresoli.net's message of "Thu, 3 Jun 2010 22:31:02 +0200")
References: <1275597062-8925-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87eiglnsg3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "luca" == luca  <luca@lucaceresoli.net> writes:

 luca> From: Luca Ceresoli <luca@lucaceresoli.net>
 luca> With BR2_PACKAGE_QT_MULTIMEDIA=y, libQtMultimedia.so.* was not
 luca> copied to the target directory.

Committed, thanks.

-- 
Bye, Peter Korsgaard
