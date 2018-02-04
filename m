From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 11:01:21 +0100
Subject: [Buildroot] [PATCH 1/1] gconf: add dependency on toolchain w/
 dynamic lib
In-Reply-To: <20180204084304.thee3f6dhvkkv5gs@sapphire.tkos.co.il> (Baruch
 Siach's message of "Sun, 4 Feb 2018 10:43:04 +0200")
References: <20180122060216.pmi3l63cmtboingq@sapphire.tkos.co.il>
 <20180122061121.9702-1-joseph.kogut@gmail.com>
 <87y3k9zp1h.fsf@dell.be.48ers.dk>
 <20180204084304.thee3f6dhvkkv5gs@sapphire.tkos.co.il>
Message-ID: <878tc9ysy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sat, Feb 03, 2018 at 11:28:10PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Joseph" == Joseph Kogut <joseph.kogut@gmail.com> writes:
 >> 
 >> > GConf fails to build when BR2_STATIC_LIBS=y.
 >> > Fixes:
 >> >     http://autobuild.buildroot.net/results/ad8a9b082006f0334010c9c4dc5a90c2071df121/
 >> 
 >> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
 >> > ---
 >> 
 >> > Thanks for the feedback, Baruch. I've updated the commit message.
 >> 
 >> Committed, thanks.

 > Not in master as of 5f3246a1d69 (gdk-pixbuf: unbreak gdk-pixbuf 
 > loaders.cache).

Sorry, fixed now.

-- 
Bye, Peter Korsgaard
