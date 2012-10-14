From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Oct 2012 20:18:15 +0200
Subject: [Buildroot] [PATCH] cairo: disable trace and trace interpreter
In-Reply-To: <1350210517-24759-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Oct 2012 12:28:37 +0200")
References: <1350210517-24759-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehl0zzmg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The Cairo tracing and trace interpreter are most likely not that
 Thomas> useful, so disable them. They also require zlib, which isn't a
 Thomas> dependency of Cairo at the moment. This fixes the following build
 Thomas> failure:

 Thomas>   http://autobuild.buildroot.org/results/a91e4e337fd9deb0f9fad433350feb27b2aee556/build-end.log

 Thomas> In the future, if people are interested by the trace and trace
 Thomas> interpreter, we can add a new Config.in knob for them.

Committed, thanks.

-- 
Bye, Peter Korsgaard
