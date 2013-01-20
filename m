From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 09:53:25 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
	startx
In-Reply-To: <50FAC272.7040909@mind.be> (Arnout Vandecappelle's message of
 "Sat, 19 Jan 2013 16:57:38 +0100")
References: <50BDEE24.6010601@wanadoo.fr> <871uf5obh3.fsf@dell.be.48ers.dk>
 <50F8218F.4070701@wanadoo.fr> <50FA9F5E.4020005@mind.be>
 <20130119144250.2d73d60d@skate> <50FAC272.7040909@mind.be>
Message-ID: <871udgfd6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout>  BTW, shouldn't xapp_xinit depend on XORG_SERVER? xinit tries
 Arnout> to start an X server... If xapp_xinit depens on XORG_SERVER
 Arnout> then the condition I proposed is no longer necessary, because
 Arnout> MCOOKIE will be selected.

That indeed seems sensible. Care to send a patch?

-- 
Bye, Peter Korsgaard
