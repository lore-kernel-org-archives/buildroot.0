From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 22 Feb 2011 13:04:57 -0600
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <20110222192538.6720529a@surf>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com><AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com><AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
	<20110222192538.6720529a@surf>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F5E169D@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas
> Petazzoni
> Sent: Tuesday, February 22, 2011 12:26 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] No response after "Freeing init memory"
> 
> On Tue, 22 Feb 2011 09:06:34 +0100
> Zden?k Materna <zdenek.materna@gmail.com> wrote:
> 
> > -------------- inittab ---------------------------------------------------
> >
> > # /etc/inittab
> > #
> > # This inittab is a basic inittab sample for sysvinit, which mimics
> > # Buildroot's default inittab for Busybox.
> 
> Aah, you have enabled sysvinit. Could you disable it, make clean &&
> make, and retry ?
> 
> Busybox already contains a default init, and it's the one most of us
> test and use on a daily basis.
> 
> I've written this sysvinit inittab not long ago, it was working for me,
> but it definitely does not receive as much testing as the sysvinit one
> gets.
> 

Isn't the main difference just S0 vs ttyS0 from the two init files?

So, (if I'm remembering correctly) a simple test would be to change
ttyS0 to S0, right?

Andy


> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
