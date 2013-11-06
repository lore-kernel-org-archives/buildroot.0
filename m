From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Nov 2013 00:07:29 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <20131106225332.GB3482@free.fr> (Yann E. MORIN's message of "Wed, 
 6 Nov 2013 23:53:32 +0100")
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk> <20131106231048.67cf2d52@skate>
 <87k3gljh5d.fsf@dell.be.48ers.dk> <20131106225332.GB3482@free.fr>
Message-ID: <8738n9jfim.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> But does this matter for USERS? I would guess users are only interested
 >> in a subset of all the packages (E.G. the ones for the arch they use or
 >> the ones enabled in their .config).

 > Yes, it does.

 > Some companies are using a very restrictive firewall, that does not
 > allow anything but plain http and https (sometime even with MITM), and
 > no cvs, git, or even ftp...

 > So, some like to get a computer to another network, do the downloads, and
 > serve them on the LAN from a mirror.

 > Sometime, the network is really slow (eg. low BW, or high latency), so
 > this is also usefull to be able to make a complete mirror.

 > Of course, that needs resyncing from time to time, but easier done than
 > coping with a bunch of cursing angry users irrupting in one's office
 > every now and then! :-)

Sure, but that's what we have 'make source' (for specific
configurations) or sources.buildroot.net (for local mirror of
everything) for, right?

-- 
Bye, Peter Korsgaard
