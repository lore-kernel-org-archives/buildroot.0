From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 May 2016 23:12:56 +0200
Subject: [Buildroot] [PATCH v2] package/pulseview: fix build when
	linking against libatomic is needed
In-Reply-To: <20160526220044.13808-1-s.martin49@gmail.com> (Samuel Martin's
 message of "Fri, 27 May 2016 00:00:44 +0200")
References: <20160526220044.13808-1-s.martin49@gmail.com>
Message-ID: <87a8j84lgn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > With some toolchains, using atomics requires to explicitly add -latomic
 > to the linker flags.

 > This change adds a patch to pulseview adding this detection and updating
 > the LDFLAGS when appropriate.

 > This patch has be sent upstream:
 >   http://article.gmane.org/gmane.comp.debugging.sigrok.devel/2097

 > Fixes:
 >   http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log

 > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1->v2:
 > - update/rework pulseview patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
