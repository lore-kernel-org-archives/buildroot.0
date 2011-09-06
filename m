From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Sep 2011 12:33:23 +0200
Subject: [Buildroot] [PATCH] libpng: bump to 1.5.4
In-Reply-To: <20110811153707.2d035b09@gmail.com> (Frederic Bassaler's message
 of "Thu, 11 Aug 2011 15:37:07 +0200")
References: <20110811153707.2d035b09@gmail.com>
Message-ID: <87zkii7yfg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frederic" == Frederic Bassaler <frederic.bassaler@gmail.com> writes:

 Frederic> Security update.
 Frederic> Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
 Frederic> ---
 Frederic>  package/libpng/libpng.mk |    4 ++--
 Frederic>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, unfortunately there's a few issues with the patch, so I cannot
apply it:

- Your mailer has word/line wrapped the patch, please consider using git
  send-email in the future

- What packages have you tried to build? A quick test shows that atleast
  directfb and libsdl-image aren't compatible with this libpng version

-- 
Bye, Peter Korsgaard
