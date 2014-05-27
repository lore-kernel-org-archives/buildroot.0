From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 08:25:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-25
In-Reply-To: <kpnc5bxqgm.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Mon, 26 May 2014 23:20:20 +0200")
References: <20140526063007.A011F10158F@stock.ovh.net>
 <kpnc5bxqgm.ln2@ID-313208.user.individual.net>
Message-ID: <874n0bg2l3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Thomas Petazzoni
 > <thomas.petazzoni@free-electrons.com> wrote
 > in news:20140526063007.A011F10158F at stock.ovh.net: 

 >> powerpc |     xserver_xorg-server-1.15.1 | NOK |
 >> http://autobuild.buildroot.net/results/a952932b832ee3296d6c225c7a9df40
 >> 8ca3eef9f/ 

 > Hi,

 > I am unable to reproduce the build failure.

It looks like a race condition. It must be quite rare though, as I don't
recall seeing it before. It would be a bit of a pity to have to use
MAKE1 for something as big as the xserver.

I suggest we ignore it for now unless it happens again.

-- 
Bye, Peter Korsgaard
