From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 13:09:50 +0200
Subject: [Buildroot] [PATCH] sconeserver: fix autobuild failures
In-Reply-To: <1368527672-17411-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 14 May 2013 11:34:32 +0100")
References: <1368527672-17411-1-git-send-email-spdawson@gmail.com>
Message-ID: <87mwrxstq9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Fix sconeserver autobuild failures such as the following.

 spdawson>   http://autobuild.buildroot.net/results/58e/58e4886a6ff41e49ac86cbf497bb509fd37f0d68/

 spdawson> The sconeserver version is bumped to a recent revision in
 spdawson> which it is possible to pass the paths to Magick++-config,
 spdawson> mysql_config and xml2-config to the configure script.

 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
