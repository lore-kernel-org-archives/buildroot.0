From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 1 Oct 2020 15:17:50 +0200
Subject: [Buildroot] [PATCH buildroot-test v2] scripts/autobuild-run:
 create host-distro file
In-Reply-To: <20200914205201.GA19902@scaer>
References: <20200914204101.16172-1-heiko.thiery@gmail.com>
 <20200914205201.GA19902@scaer>
Message-ID: <CAEyMn7abATBZTkH1wqg+JXcmd9_paGWTO4GCd=ZWZ_WJAwJrNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Hi Thomas,

Am Mo., 14. Sept. 2020 um 22:52 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, Thomas, All,
>
> On 2020-09-14 22:41 +0200, Heiko Thiery spake thusly:
> > Sometimes autobuilder failures occur only on a specific distribution. To
> > ease the research for the maintainer/developers add the host distribution
> > information to the result archive.
> >
> > The distribution information comes from '/etc/os-release' (or
> > '/usr/lib/os-release') that seems to be present on the most common distros:
> >
> > Debian: https://manpages.debian.org/buster/systemd/os-release.5.en.html
> > Ubuntu: http://manpages.ubuntu.com/manpages/bionic/man5/os-release.5.html
> > Red Red: https://www.freedesktop.org/software/systemd/man/os-release.html
> > Open-Suse: https://en.opensuse.org/SDB:Find_openSUSE_version
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>

I'm hunting an issue with building libnetconf2 in autobuilder [1].
Meanwhile I think I figured out the issue. But it would be great to
know the host system and version used by the autobuilder. Any chance
to get this patch in?

[1] http://autobuild.buildroot.net/results/2be8b4c60a618ab58590c1fe2d470efa06f6460f/
[2] http://autobuild.buildroot.net/results/bc494a109899f423293d079ae817e69dc52b809e/

--
Heiko
