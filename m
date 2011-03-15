From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Tue, 15 Mar 2011 14:32:07 -0400
Subject: [Buildroot] inittab for Busybox
In-Reply-To: <20110315192211.3c59f861@surf>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
Message-ID: <1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Really!! 'make clean' from Buildroot directory? That's a complete rebuild!!

How come then it picked up my other Busybox change without having to do a global re-build?

thanx
/carl h.

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: March 15, 2011 2:22 PM
> To: Heyendal, Carl
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] inittab for Busybox
> 
> Hello,
> 
> On Tue, 15 Mar 2011 14:14:09 -0400
> "Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:
> 
> > Hmmmm....I unselected the sysvinit option in busybox and recompiled
> > from Buildroot.
> 
> Yes, but you didn't do "make clean; make", so the etc/inittab in the
> target is still the one from sysvinit.
> 
> Regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
