From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 11 May 2017 09:33:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-10
In-Reply-To: <20170511062842.8AC6121D45@mail.free-electrons.com>
References: <20170511062842.8AC6121D45@mail.free-electrons.com>
Message-ID: <CAGm1_kuce8He8uG1CH4a0XyuFaO6C5zBVVzYQkz7qGmz+r36ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 11, 2017 at 8:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-05-10
> ================================
>
>       successes : 253
>        failures : 24
>        timeouts : 0
>           TOTAL : 277
>
> Classification of failures by reason
> ====================================
>
>                     radvd-2.12 | 4
>            modem-manager-1.6.4 | 3
>                  efibootmgr-14 | 2
>                   libcdio-0.94 | 2
>         ltp-testsuite-20170116 | 2
> openblas-f04af36ad0e85b64f1... | 2
>                pulseview-0.3.0 | 2
>              rabbitmq-c-v0.8.0 | 2
>           mediastreamer-2.14.0 | 1
>                 protobuf-3.2.0 | 1
>           qt5declarative-5.8.0 | 1
>                      qwt-6.1.3 | 1
>               strongswan-5.4.0 | 1
>
>
> Detail of failures
> ===================
>
>          arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/87c3ff2427331eb9ab31c9eb685fe80954a0a98f |
>          arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/368656c338f6ea732f564291d660bc1721b34af7 |
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/c909e8c397ab972b6aa4d370572cad4fae284d00 |
>          arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/d681917034730d374092881e90875d3149e31774 |
>          arm |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/cb94f4859c7cf60c76dd978ed941883ff732ba11 |
>        sparc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/e68191d1ae42100119ab2f872eeff8ba4b1b7c8d |
>         m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/775c81b5d0064cb196bbb367368dd76eb46ecf93 | ORPH
>          arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/fe9b6b1b1399a4e8aafc6a326c81ec97c2480025 |
>         i686 |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/40eef797b4d8d53fc6e10f2048316d63549caf6d |
>          arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/e3e3b61fb1162648f45c73b2a07509e0ab95b3d4 |

Hi Matthew,

this issues looks like the one you've fixed for libqmi. Could you take a look?

Thanks,
Yegor

>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2fce6f9607019c25e5dfff49dacddb199ef885cf |
>        sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/437c6e3e49742a29a33b1cc6b450fdf9b0561dc5 |
>        sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3111e01f89f6038964c1aed1f2504cbc63ce8d62 | ORPH
>         i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/c6a60e9f6395b8dbd457be57642dfaa1c8d86104 |
>         i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/1729c660f2d43504b684be0b1a156b92652d3dba |
>         i586 |           qt5declarative-5.8.0 | NOK | http://autobuild.buildroot.net/results/9e3f14e342be2a7f6204173a30cb1f01570c971a |
>          arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/739406bb8073d1861933872a47802954d9767634 | ORPH
>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a1a7e938ac4260802bf0e24f64829d559295ef39 |
>         m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2c08a56053afef4b475790571ba0f4d9c506ec29 |
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/469d3e2f0c0739787b52e8497cf22a1571d8a001 | ORPH
> microblazeel |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/24b2e2e515987cca86d2905f8cbcea820755d526 | ORPH
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/fa0c3393c2bcdbc2287c3b8a96cd16e2845a22a3 | ORPH
>       xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/d3796b9dbdaf93b6bfa66633d111729e0745c2c0 | ORPH
>       x86_64 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/6120add5ad6e7f5d575fc2a2442cd7fe5302eb46 |
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
