From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 19 May 2016 08:38:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-05-18
In-Reply-To: <20160519063019.BA798101875@stock.ovh.net>
References: <20160519063019.BA798101875@stock.ovh.net>
Message-ID: <CAGm1_kt=7CFt-oL6zSg3H5MWZ-MA1z-0ZNrAKJ6SipBLd92tpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 19, 2016 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2016-05-18
> ===============================
>
>         success : 103
>        failures : 26
>        timeouts : 0
>           TOTAL : 129
>
> Classification of failures by reason
> ====================================
>
>                 collectd-5.5.1 | 3
>                     mosh-1.2.5 | 3
>                      vlc-2.2.3 | 2
>                 wayland-1.10.0 | 2
>                     ruby-2.3.1 | 1
>                   ffmpeg-2.8.7 | 1
>       kismet-Kismet-2014-02-R1 | 1
>                 moarvm-2016.04 | 1
> hidapi-d17db57b9d4354752e0a... | 1
>                      rpm-5.2.0 | 1
>                iptraf-ng-1.1.4 | 1
>                   qemu-2.5.1.1 | 1
>                  host-go-1.6.2 | 1
>              stress-ng-0.06.02 | 1
>             qt5serialbus-5.6.0 | 1
>                 oprofile-1.1.0 | 1
>              host-gauche-0.9.4 | 1
>                      lxc-1.1.5 | 1
>                     cups-2.1.2 | 1
> android-tools-4.2.2+git2013... | 1
>
> Detail of failures
> ===================
>
>     mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3ca91c73896e68c2daa58cfd90db8bbdd0370683/
>       mipsel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/50d575211014cf2f7c6e94b16834da533abaec72/
>        nios2 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/7ef344a9433869b1ecab44cba2e688850256f017/
>      powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/bddf941801a3b13b540c7c48f7585e392625bac6/
>          arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/2b82c937fef7d67d266ee49c60eac16323a4f0c3/
>        nios2 |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/6e50f0c8e2519f4cf04e12403a28251dd280224c/
>     mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/8a8a9d405ff83c56fa3a5967568681dce593355d/
>         i686 |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/577474152f447cf680b4397db6b6894ccd44399d/
>          arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/12999df74adf12913bf68d815e5af479243c7b81/
>       x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/bd12bc74fcc89b927e2a0745522c1ec563e5822e/
>          arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/19e80242a4d8ee37b0a164f591372f9d72626781/
>       x86_64 |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/f321823be6b477be7dc55393e563a3a61794265d/
>        sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/e81c75eb6ec7243ecc749268d9fdf22eed5af2a2/
>     mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/fbdddcff0b8b109c249a68ee273126adf3592c7b/
>       mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/9620b355871a1ecf2f6494b913a9790f5224268e/
>       mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/3e4dd673faf4ece99d9d2a0890ec8daf0edf8ded/
> microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/155d084fdeda3372ad8415870f509821b98efa4a/
>          arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/f72fdee4baced35b5d657d3a197bbdb3179bf173/
>         i686 |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/d6e96c15e0fc6b9f33b0d778e81ebc6a3ed43a5b/

Fixed by http://patchwork.ozlabs.org/patch/623421/

>          sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/331adfb1ddbb12911b63def7225c21edd14f6e7b/
>         bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/15dc11787147f812f13ce534aac82246bc24a3ff/
>        nios2 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/0ee3132f4ee6b5f21851f93516e0d0c419b36b1b/
>          arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/6d16d98b1ae7b93f4388f406544c7121a3d33aa0/
>      powerpc |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/18eaa5708636f7a002c4aca5392f7614d8f734c6/
>         bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/ffac0975697f02827ffcae5b71d2520cd411b749/
>         bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/8ee41e503cbc4733830323a3acf59505cfaa77b9/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
