From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 23:28:10 +0100
Subject: [Buildroot] [PATCH 1/1] gconf: add dependency on toolchain w/
 dynamic lib
In-Reply-To: <20180122061121.9702-1-joseph.kogut@gmail.com> (Joseph Kogut's
 message of "Sun, 21 Jan 2018 22:11:21 -0800")
References: <20180122060216.pmi3l63cmtboingq@sapphire.tkos.co.il>
 <20180122061121.9702-1-joseph.kogut@gmail.com>
Message-ID: <87y3k9zp1h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph Kogut <joseph.kogut@gmail.com> writes:

 > GConf fails to build when BR2_STATIC_LIBS=y.
 > Fixes:
 >     http://autobuild.buildroot.net/results/ad8a9b082006f0334010c9c4dc5a90c2071df121/

 > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
 > ---

 > Thanks for the feedback, Baruch. I've updated the commit message.

Committed, thanks.

-- 
Bye, Peter Korsgaard
