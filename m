From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 15 Apr 2020 23:20:59 -0300
Subject: [Buildroot] [PATCH/next v2 3/4] package/openrc: add libselinux
 support
In-Reply-To: <20200311172623.GN5357@scaer>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-4-unixmania@gmail.com>
 <20200311172623.GN5357@scaer>
Message-ID: <CAJ4jsacCmrVSHeFjWT6R_3bXr1JN7XhKZeYzoayTmoQxUYYMCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 11, 2020 at 2:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
> On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > If the libselinux package is selected, add the package to the dependency list
> > and explicitly set OPENRC_MAKE_OPTS += MKSELINUX=yes
>
> This SELinux stuff has always been a bit boo-I-dont-want-too-touch for
> me, because it looks overly complex, so just adding the dependency
> without explanations on how openrc uses/fits with SELinux is a bit too
> much for me to handle, so I defer to a SELinux-knowledgeable maintainer
> to look a it...

I tested it.

-- 
Carlos Santos <unixmania@gmail.com>
