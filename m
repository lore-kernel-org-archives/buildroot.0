From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 16:57:00 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix race condition
	when installing man pages, 2nd try
In-Reply-To: <XnsA365A6B0A90EFberndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Wed, 09 Jul 2014 16:23:11 +0200")
References: <1404569546-12346-1-git-send-email-bernd.kuhls@t-online.de>
 <87k37mu0i5.fsf@dell.be.48ers.dk>
 <XnsA365A6B0A90EFberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87oawyshqb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 >> What does this have to do with $SUBJECT? If it isn't needed, then it
 >> should be removed in a seperate commit (with a proper description why).

 > Hi,

 > host-xfont_font-util was added with xserver_xorg-server-400-fix-man.patch 
 > because it was needed to autoreconf xserver_xorg-server, which is not 
 > necessary anymore, see the link I quoted above.

Ahh - Sorry, I missed that - Will fix.

-- 
Bye, Peter Korsgaard
