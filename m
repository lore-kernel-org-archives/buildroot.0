From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 23:35:47 +0200
Subject: [Buildroot] [UNSURE]Re: [UNSURE]Re: [PATCH 1/5] lua : fix
 autobuild.buildroot
In-Reply-To: <CAB0FRsuBVmsA66yUYw4+g-t2EnVXqvgfV1z5yhuqJi=eUga5GA@mail.gmail.com>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <20120716173958.39ab39b3@skate>
 <CAB0FRsszFbq5_yMhpxeW4NzQHJ1oG24S1+SGoj8qgR0-3A3rBw@mail.gmail.com>
 <20120717104000.695658f8@skate>
 <CAB0FRss38A4p+34=D+L42tdkyevrpFV5M5ZcZt4UDGksh8Nvvw@mail.gmail.com>
 <20120717165710.7b1a0dd0@skate>
 <CAB0FRsuBVmsA66yUYw4+g-t2EnVXqvgfV1z5yhuqJi=eUga5GA@mail.gmail.com>
Message-ID: <20120717233547.3b9c5db1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 17:20:58 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> as you suggest, I use (with success) the proposal of Jean-Christophe
> Plagnol-Villard
> (http://patchwork.ozlabs.org/patch/153235/)
> so now, in fact, I wait you integrate it.

Please send a proper patch set with all the patches that are needed. If
you want your changes to be integrated, they need to be easy to review
and integrate. And for the moment, you're just sending multiple
individual patches, hoping that someone will figure out which patch
still makes sense, how the patches relate between each other, etc.

I have applied your patches that rework the Lua interpreter patches,
but for the luajit package, I'm waiting for a clean patch series from
you in order to merge things. And when you send updated versions of
your patches, please send a new complete series of patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
