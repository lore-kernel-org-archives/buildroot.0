From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 10:39:24 +0100
Subject: [Buildroot] [PATCH] lcdapi: fix autobuilder failures
In-Reply-To: <1351586827-17432-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 30 Oct 2012 08:47:07 +0000")
References: <1351586827-17432-1-git-send-email-spdawson@gmail.com>
Message-ID: <87y5ijyqib.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com> Version 0.3 of the
 spdawson> lcdapi package does not correctly handle CXXFLAGS passed in
 spdawson> from the environment/command line. In particular, the passing
 spdawson> in of CXXFLAGS clobbers the -fPIC flag which is set in the
 spdawson> top-level lcdapi makefile.

 spdawson> The following autobuild logs highlight the problem.
  
 spdawson>   http://autobuild.buildroot.net/results/9a47b4a70d29308f668d65d983ba6146c0c56365/build-end.log

 spdawson>   http://autobuild.buildroot.net/results/4a4f6e2e7f80d5a23c9d26069094e9dafb1468e7/build-end.log

 spdawson>   http://autobuild.buildroot.net/results/0d96c207a9db44cf2791a66cad5162a739e7053a/build-end.log

 spdawson> This has been fixed upstream in version 0.4; this patch
 spdawson> simply bumps the version number in the Buildroot lcdapi
 spdawson> package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
