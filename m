From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 23:14:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: use --with-sound
 option
In-Reply-To: <20200315225013.0c7556ec@windsurf>
References: <20200314223641.2552635-1-fontaine.fabrice@gmail.com>
 <20200315220704.4d588598@windsurf> <20200315211018.GK19677@scaer>
 <20200315225013.0c7556ec@windsurf>
Message-ID: <CAPi7W816Z0ngAapVQQq3VK3U5xwx4sSY8ZtEOkq69aD69T4OGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le dim. 15 mars 2020 ? 22:50, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 15 Mar 2020 22:10:18 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > Which is indeed what happens here;
> >
> >     https://github.com/rdesktop/rdesktop/blob/master/configure.ac#L286
>
> If I read
> https://github.com/rdesktop/rdesktop/blob/master/configure.ac#L323
> correctly, it means that --with-sound (or --with-sound=yes) will allow
> multiple audio backends to be supported at the same time.
>
> While passing any other --with-sound=foo will only support the foo
> audio backend.
>
> So in fact, passing --with-sound=foo is annoying, because you cannot
> support multiple audio backends.
Indeed, I was too quick on this one, I'll set it as rejected.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
