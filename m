From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 16 Jul 2012 11:09:41 +0200
Subject: [Buildroot] Systemd update
In-Reply-To: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
References: <CADiAo4KdxANfaB4xZyWBZe_w+y-p9UTJ1FVjcX7=KgRHkinVHQ@mail.gmail.com>
Message-ID: <5003DA55.1010703@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

Le 13/07/2012 18:08, Dmitry Golubovsky a ?crit :
> I have reached some progress with adopting systemd for Buidlroot with
> proper PAM login support and working system journal.
> 
> I suggested some of my patches for upstream [1], but systemd
> maintainers were not very much interested in fixes around uclibc
> missing features [2], so let's keep these patches with Buildroot.
> 
> My patches and package configs are collected under this Gitorious
> project [3] which is my test bench for packages being adopted for
> Buildroot, and in particular under [4]. Patches are applicable to the
> v186 snapshot of systemd (the latest avalable).
> 
> The patches are not 100% final at the moment I am writing this (there
> are few typos I spotted and will fix them ASAP). However I am
> announcing these patches for early review by the Buildroot community.

Could you send these patches to the mailing list using git send-email
please ? You can find a nice tutorial here:
http://lists.busybox.net/pipermail/buildroot/2010-December/039181.html

This way, we will be able to properly review these changes.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
