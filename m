From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 10:03:32 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <CAAfyv37=U0YtKsNkoCxTA2iRAXwgTETrcuOPWXmvNasnOqZaSA@mail.gmail.com>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
 <20121218094835.688afe2c@skate>
 <CAAfyv37=U0YtKsNkoCxTA2iRAXwgTETrcuOPWXmvNasnOqZaSA@mail.gmail.com>
Message-ID: <20121218100332.7a0c10d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Tue, 18 Dec 2012 09:52:41 +0100, Belisko Marek wrote:

> > Hum, why is this needed? Does sg3_utils installs some libraries or
> > headers that are useful for other packages?
> I'm working on adding udisks to buildroot and udisks have dependency on
> sg3-utils library so this is the reason why installing to staging.

Ok. A comment just before the _INSTALL_STAGING line would be useful,
then, because for a "utils" package, we don't necessarily expect to
have a library in it.

> I've read somewhere on ML you was working also on udisks package.
> Was it successful?

It was a looong time ago. I think I managed to get udisks to build, but
I hadn't had the time to do some real testing with it: I was first
doing some testing of polkit, which is a dependency of udisks.

I've put online the 3 patches I had done at that time (note that they
are old: they still use the old AUTOTARGETS macro name), see:
http://free-electrons.com/~thomas/pub/udisks-buildroot/

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
