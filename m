From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 May 2014 23:35:50 +0200
Subject: [Buildroot] [PATCH] duma: not available on non-MMU platforms
In-Reply-To: <1400435100-10211-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 18 May 2014 19:45:00 +0200")
References: <1400435100-10211-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbt2lqh5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > By design, building duma on Blackfin and other non-MMU platforms is
 > quite useless: it uses page mappings to detect buffer overrun and
 > use-after-free programming errors. Therefore, this commit simply marks
 > duma as not available on non-MMU platforms.

 > Fixes:

 >   http://autobuild.buildroot.org/results/951/9519d7abb45c6a789874ec6bb84418c31a98916b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
