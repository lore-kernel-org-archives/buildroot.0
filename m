From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2014 21:31:34 +0200
Subject: [Buildroot] [PATCH] webkit: disable on SuperH
In-Reply-To: <1409140462-10560-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Aug 2014 13:54:22 +0200")
References: <1409140462-10560-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r401u3u1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Webkit has been failing on SuperH since a long time, with nobody
 > caring to fix the problem. Since anyway our Webkit version is old and
 > in the process of being updated, our best option for 2014.08 is to
 > simply disallow Webkit on SuperH.

 > Fixes:

 >   http://autobuild.buildroot.org/results/3a0/3a0c48f65c06f7f19e608d54307c0788a0130589/
 >   http://autobuild.buildroot.org/?reason=webkit-1.11.5&arch=sh4a

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
