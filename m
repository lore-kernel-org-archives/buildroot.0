From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 20:44:40 +0200
Subject: [Buildroot] [PATCH] package/opencv: fix opencv.pc generation
In-Reply-To: <1431867794-6291-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 17 May 2015 15:03:14 +0200")
References: <1431867794-6291-1-git-send-email-s.martin49@gmail.com>
Message-ID: <871tif82nb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This change fixes build of packages depending on opencv and using
 > pkg-config to get the opencv LDFLAGS, which were wrongly ordered for
 > static build and included absolute path pointing to the host system
 > libraries instead of the sysroot ones.

 > This patch fixes build issues with gst1-plugins-bad and vlc.

 > This change introduce and new patch to opencv, which is already merged
 > upstream [1].

 > Fixes:
 >   http://autobuild.buildroot.net/results/c70/c70f793c7c3b380428d6e2e622a90805cffc4dd1/
 >   ... and many others

 > [1] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656

 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

 > ---
 > Note that this fix is for upcoming 2015.05 release, and I am already
 > preparing a series bumping of the opencv package for the next release. :)

great!

-- 
Bye, Peter Korsgaard
