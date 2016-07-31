From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 23:36:50 +0200
Subject: [Buildroot] [PATCH] warpboard: README: Improve instructions
	about using wifi
In-Reply-To: <1469903793-5987-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Sat, 30 Jul 2016 15:36:33 -0300")
References: <1469903793-5987-1-git-send-email-festevam@gmail.com>
Message-ID: <87k2g1pk0d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > From: Fabio Estevam <fabio.estevam@nxp.com>
 > Provide a more complete set of instructions on how to get Wifi
 > working on the warpboard.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
 > ---
 >  board/freescale/warpboard/README | 12 +++++++++++-
 >  1 file changed, 11 insertions(+), 1 deletion(-)

 > diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
 > index 871d5cd..d900c6d 100644
 > --- a/board/freescale/warpboard/README
 > +++ b/board/freescale/warpboard/README
 > @@ -66,4 +66,14 @@ $ hciconfig hci0 up
 >  Using Wifi
 >  ==========
 
 > -$ ifconfig wlan0 up
 > +Enable the wireless_utils and wpa_suplicant packages, and then run:

Perhaps we should enable these in the defconfig then?

Committed, thanks.

-- 
Bye, Peter Korsgaard
