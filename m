From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 18 Jan 2020 17:22:17 -0300
Subject: [Buildroot] [PATCH v3 next] package/tar: bump target version to
 1.32 (host is kept at 1.29)
In-Reply-To: <20200118145154.GC22540@scaer>
References: <20191119121831.2329-1-unixmania@gmail.com>
 <20200118123934.GV22540@scaer>
 <CAJ4jsae+9emfBSo1x9CHsNszj62fMx6Su-Jixp_OsbJbYL4ucw@mail.gmail.com>
 <20200118145154.GC22540@scaer>
Message-ID: <CAJ4jsafKVR0m6BZpAr3=tL-z8QNadykF-8Nw8xDTKUEDCbSW_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 18, 2020 at 11:52 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Carlos, All,
>
> On 2020-01-18 11:12 -0300, Carlos Santos spake thusly:
> > On Sat, Jan 18, 2020 at 9:39 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2019-11-19 09:18 -0300, unixmania at gmail.com spake thusly:
> > > > From: Luc Creti <luc.creti@atos.net>
> [--SNIP--]
> > > > Hence host-tar must be kept at version 1.29.
> [--SNIP--]
> > > Applied to master, with all the host-related commentsd and variables
> > > moved down to gether. Thanks.
> > Can't we at least get rid of the cpio thing, as done in v5?
>
> Why? We can't ensure that the host has tar, and if it does, we can't be
> sure we can rely on it to extract the tarball.
>
> cpio is present virtually everywhere, and its format has been stable for
> the longest time.
>
> Regards,
> Yann E. MORIN.

CPIO(1L)                                                      CPIO(1L)

NAME
       cpio - copy files to and from archives

__WARNING__
       The cpio utility is considered LEGACY based on POSIX specifica?
       tion.  Users are encouraged to use other  archiving  tools  for
       archive creation.

-- 
Carlos Santos <unixmania@gmail.com>
