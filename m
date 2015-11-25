From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Nov 2015 17:59:47 +0100
Subject: [Buildroot] WiringPi - problem adding package to my buildroot
In-Reply-To: <CACvocV5CCVqmVprW-07Ci7bUoahKHwK4JACJBjcJxWHesXnoNw@mail.gmail.com>
References: <CACvocV5bQo_YG05=ujYEJHygDQCw6_XZDLJ9zdCLO4tGCSswtg@mail.gmail.com>
 <20151124204546.2039bf73@gmx.net>
 <CACvocV5CCVqmVprW-07Ci7bUoahKHwK4JACJBjcJxWHesXnoNw@mail.gmail.com>
Message-ID: <20151125175947.0752dbbd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giovanni,

On Wed, 25 Nov 2015 10:47:05 +0100, "astrolite ." <ciclonite@gmail.com> wrote:

> Hi Peter,
> 
> Forgot to ask: Why a fork from the original sources? Whats wrong
> > with the original WiringPi buildsystem?
> >
> > Regards,
> > Peter
> >
> >
> >
> I'm use wiringPi with buildroot-2015.05 .
> I cannot find wiringPi in this buildroot version.
> I miss something?

The wiringPi fork https://github.com/ciclonite/wiringPi on github is yours?

Why fork from the original wiringPi sources? See my patch [1] which compiles
wiringPi using the original wiringPi sources using the origial build system...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/548287/

> Thanks,
> Giovanni
