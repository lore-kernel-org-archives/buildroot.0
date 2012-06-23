From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jun 2012 09:36:12 +0200
Subject: [Buildroot] [PATCH] sudo: fix install
In-Reply-To: <1340268304-26103-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 21 Jun 2012 09:45:04 +0100")
References: <1340268304-26103-1-git-send-email-spdawson@gmail.com>
Message-ID: <871ul6eaz7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Running sudo on the target fails with the following errors.

 spdawson>   sudo: /usr/libexec/sudoers.so: No such file or directory
 spdawson>   sudo: fatal error, unable to load plugins

Committed, thanks.

-- 
Bye, Peter Korsgaard
