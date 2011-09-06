From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Sep 2011 21:59:42 +0200
Subject: [Buildroot] [PATCH] libpng: bump to 1.5.4
In-Reply-To: <20110906204818.64b8b537@gmail.com> (Frederic Bassaler's message
 of "Tue, 6 Sep 2011 20:48:18 +0200")
References: <20110811153707.2d035b09@gmail.com>
 <87zkii7yfg.fsf@macbook.be.48ers.dk>
 <20110906204818.64b8b537@gmail.com>
Message-ID: <87ehztl9w1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frederic" == Frederic Bassaler <frederic.bassaler@gmail.com> writes:

 >> Thanks, unfortunately there's a few issues with the patch, so I cannot
 >> apply it:
 >> 
 >> - Your mailer has word/line wrapped the patch, please consider using
 >> git send-email in the future
 >> 
 >> - What packages have you tried to build? A quick test shows that
 >> atleast directfb and libsdl-image aren't compatible with this libpng
 >> version

 Frederic> Hi Peter

 Frederic> I think I was trying to build imlib2

 Frederic> http://lists.busybox.net/pipermail/buildroot/2011-August/045025.html

Ok, but libpng is used by lots of packages, and (unfortunately) stuff
relatively often breaks with new libpng versions, so it needs quite some
testing before we can upgrade.

-- 
Bye, Peter Korsgaard
