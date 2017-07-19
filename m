From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 18:19:03 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: install missing
	library
In-Reply-To: <20170715120600.4554beee@windsurf> (Thomas Petazzoni's message of
 "Sat, 15 Jul 2017 12:06:00 +0200")
References: <20170714220936.25212-1-yann.morin.1998@free.fr>
 <20170715090831.1ed20473@windsurf> <20170715094537.GA3095@scaer>
 <20170715120600.4554beee@windsurf>
Message-ID: <87lgnk762w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 15 Jul 2017 11:45:37 +0200, Yann E. MORIN wrote:

 >> On 2017-07-15 09:08 +0200, Thomas Petazzoni spake thusly:
 >> > On Sat, 15 Jul 2017 00:09:36 +0200, Yann E. MORIN wrote:  
 >> > > The vcdbg utility is linked to a few libraries, which so far were all
 >> > > provided by the rpi-userland package.
 >> > > 
 >> > > But a not-so-recent bump of rpi-firmware pulled in a vcdbg that is
 >> > > linked to an additional library, which is not privided by rpi-userland,
 >> > > so we must install it.  
 >> > 
 >> > Could you qualify "not-so-recent" bump ? It's just to know if this is
 >> > applicable to our LTS release.  
 >> 
 >> The library was added in September 2016, and we bumped since then, so
 >> yes, the fix applies to both the LTS branch and the maintenance branch
 >> as well.

 > ACK. So Peter: please apply to 2017.02.x and 2017.05.x! :-)

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
