From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 01:11:39 +0100
Subject: [Buildroot] [PATCH] sconeserver: fix imagemagick build failures
In-Reply-To: <1354806770-1673-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 6 Dec 2012 15:12:50 +0000")
References: <1354806770-1673-1-git-send-email-spdawson@gmail.com>
Message-ID: <87sj76g8jo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> The sconeserver configure script uses Magick++-config to
 spdawson> obtain compiler and linker arguments for the imagemagick
 spdawson> libraries. This doesn't work in Buildroot, and causes build
 spdawson> failures such as the following

 spdawson>   http://autobuild.buildroot.net/results/7833edd60bbb2c291aea1efb5ccf407da7f4a51f/build-end.log

 spdawson> The upstream sconeserver code has been changed to use
 spdawson> pkg-config directly, instead of Magick++-config; this patch
 spdawson> adapts the sconeserver package to the upstream change.

 spdawson> Both this patch and the associated upstream change are based
 spdawson> on a Buildroot patch submitted by Samuel Martin:
 spdawson> http://patchwork.ozlabs.org/patch/200901/

Committed, thanks.

-- 
Bye, Peter Korsgaard
