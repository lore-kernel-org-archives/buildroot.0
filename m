From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 10:00:16 +0100
Subject: [Buildroot] [PATCH] gpm: disable on !MMU, requires fork()
In-Reply-To: <1392973038-21880-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 21 Feb 2014 09:57:18 +0100")
References: <1392973038-21880-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n3sx2lb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/b2b/b2beb4876fba22f139df9c336ff0fae77354721b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
