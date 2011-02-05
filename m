From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Feb 2011 08:31:24 +0100
Subject: [Buildroot] easynews sourceforge mirror is down
In-Reply-To: <AANLkTi=WoaejX3iJWteTEprkeY=sWDFLY2dSC1PgiKHL@mail.gmail.com>
	(bruce bushby's message of "Sat, 5 Feb 2011 07:11:47 +0000")
References: <AANLkTi=WoaejX3iJWteTEprkeY=sWDFLY2dSC1PgiKHL@mail.gmail.com>
Message-ID: <87pqr7os37.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bruce" == bruce bushby <bruce.bushby@gmail.com> writes:

 bruce> Hi

 bruce> Not sure if the site is down for maintenance but the "easynews"
 bruce> sourceforge mirror is no longer responding.

Yeah, I noticed as well. It's probably related to the recent sf.net
breakin attempts.

 bruce> To get around this with existing config I simply added a local hosts file entry
 bruce> using the IP address for "switch.dl.sourceforge.net"

 bruce> echo "130.59.138.21 easynews.sourceforge.net" >> /etc/hosts

Or you can simply select another sf.net mirror in Build options ->
Mirrors and download locations -> Sourceforge mirror site ;)

-- 
Bye, Peter Korsgaard
