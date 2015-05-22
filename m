From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 07:22:46 +0200
Subject: [Buildroot] [PATCH] package/protobuf: autoreconf is now needed
In-Reply-To: <1432269020-9421-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Fri, 22 May 2015 06:30:20 +0200")
References: <1432269020-9421-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87lhgh2nkp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Since its update, the *_SITE points to the git repository, so configure
 > script is not generated in this tarball.

 > Fixes:
 >   http://autobuild.buildroot.org/results/ccb/ccba6d8c73b5e826b86065b77b3fe5077db7b99c/
 >   http://autobuild.buildroot.org/results/57e/57ea34e9b48293075e10f0dd2331de2785730827/
 >   and many more...

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
