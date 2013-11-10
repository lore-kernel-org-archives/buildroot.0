From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 23:36:57 +0100
Subject: [Buildroot] [PATCH] zmqpp: fix build failure
In-Reply-To: <1384117113-6710-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 10 Nov 2013 20:58:33 +0000")
References: <1384117113-6710-1-git-send-email-spdawson@gmail.com>
Message-ID: <871u2ndgty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

> From: Simon Dawson <spdawson@gmail.com>
> The zmqpp client needs a little help to link against libpthread. Fix build
> failures such as the following.

>   http://autobuild.buildroot.net/results/d0a/d0a740d4d5414844ca7f2de266fc92223d3d20c8

Committed, thanks.

-- 
Bye, Peter Korsgaard
