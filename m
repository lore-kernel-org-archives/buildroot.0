From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 May 2017 07:22:46 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-10
In-Reply-To: <CAGm1_kuce8He8uG1CH4a0XyuFaO6C5zBVVzYQkz7qGmz+r36ug@mail.gmail.com>
References: <20170511062842.8AC6121D45@mail.free-electrons.com>
 <CAGm1_kuce8He8uG1CH4a0XyuFaO6C5zBVVzYQkz7qGmz+r36ug@mail.gmail.com>
Message-ID: <CANQCQpaDCSqu9iKLeuTyB4+py5L2JDjPSYDWgxoFUuS2vF1mCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Thursday, May 11, 2017, Yegor Yefremov <yegorslists@googlemail.com>
wrote:

> On Thu, May 11, 2017 at 8:28 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com <javascript:;>> wrote:
> > Hello,
> >
> > Build statistics for 2017-05-10
> > ================================
> >
> >       successes : 253
> >        failures : 24
> >        timeouts : 0
> >           TOTAL : 277
> >
> > Classification of failures by reason
> > ====================================
> >
> >                     radvd-2.12 | 4
> >            modem-manager-1.6.4 | 3
> >                  efibootmgr-14 | 2
> >                   libcdio-0.94 | 2
> >         ltp-testsuite-20170116 | 2
> > openblas-f04af36ad0e85b64f1... | 2
> >                pulseview-0.3.0 | 2
> >              rabbitmq-c-v0.8.0 | 2
> >           mediastreamer-2.14.0 | 1
> >                 protobuf-3.2.0 | 1
> >           qt5declarative-5.8.0 | 1
> >                      qwt-6.1.3 | 1
> >               strongswan-5.4.0 | 1
> >
> >
> > Detail of failures
> > ===================
> >
> >          arm |                  efibootmgr-14 | NOK |
> http://autobuild.buildroot.net/results/87c3ff2427331eb9ab31c9eb685fe8
> 0954a0a98f |
> >          arm |                  efibootmgr-14 | NOK |
> http://autobuild.buildroot.net/results/368656c338f6ea732f564291d660bc
> 1721b34af7 |
> >          arc |                   libcdio-0.94 | NOK |
> http://autobuild.buildroot.net/results/c909e8c397ab972b6aa4d370572cad
> 4fae284d00 |
> >          arc |                   libcdio-0.94 | NOK |
> http://autobuild.buildroot.net/results/d681917034730d374092881e90875d
> 3149e31774 |
> >          arm |         ltp-testsuite-20170116 | NOK |
> http://autobuild.buildroot.net/results/cb94f4859c7cf60c76dd978ed94188
> 3ff732ba11 |
> >        sparc |         ltp-testsuite-20170116 | NOK |
> http://autobuild.buildroot.net/results/e68191d1ae42100119ab2f872eeff8
> ba4b1b7c8d |
> >         m68k |           mediastreamer-2.14.0 | NOK |
> http://autobuild.buildroot.net/results/775c81b5d0064cb196bbb367368dd7
> 6eb46ecf93 | ORPH
> >          arm |            modem-manager-1.6.4 | NOK |
> http://autobuild.buildroot.net/results/fe9b6b1b1399a4e8aafc6a326c81ec
> 97c2480025 |
> >         i686 |            modem-manager-1.6.4 | NOK |
> http://autobuild.buildroot.net/results/40eef797b4d8d53fc6e10f2048316d
> 63549caf6d |
> >          arm |            modem-manager-1.6.4 | NOK |
> http://autobuild.buildroot.net/results/e3e3b61fb1162648f45c73b2a07509
> e0ab95b3d4 |
>
> Hi Matthew,
>
> this issues looks like the one you've fixed for libqmi. Could you take a
> look?
>
>
>
Sure


>
> >        sparc | openblas-f04af36ad0e85b64f1... | NOK |
> http://autobuild.buildroot.net/results/2fce6f9607019c25e5dfff49dacddb
> 199ef885cf |
> >        sparc | openblas-f04af36ad0e85b64f1... | NOK |
> http://autobuild.buildroot.net/results/437c6e3e49742a29a33b1cc6b450fd
> f9b0561dc5 |
> >        sparc |                 protobuf-3.2.0 | NOK |
> http://autobuild.buildroot.net/results/3111e01f89f6038964c1aed1f2504c
> bc63ce8d62 | ORPH
> >         i686 |                pulseview-0.3.0 | NOK |
> http://autobuild.buildroot.net/results/c6a60e9f6395b8dbd457be57642dfa
> a1c8d86104 |
> >         i686 |                pulseview-0.3.0 | NOK |
> http://autobuild.buildroot.net/results/1729c660f2d43504b684be0b1a156b
> 92652d3dba |
> >         i586 |           qt5declarative-5.8.0 | NOK |
> http://autobuild.buildroot.net/results/9e3f14e342be2a7f6204173a30cb1f
> 01570c971a |
> >          arm |                      qwt-6.1.3 | NOK |
> http://autobuild.buildroot.net/results/739406bb8073d1861933872a478029
> 54d9767634 | ORPH
> >          arm |              rabbitmq-c-v0.8.0 | NOK |
> http://autobuild.buildroot.net/results/a1a7e938ac4260802bf0e24f64829d
> 559295ef39 |
> >         m68k |              rabbitmq-c-v0.8.0 | NOK |
> http://autobuild.buildroot.net/results/2c08a56053afef4b475790571ba0f4
> d9c506ec29 |
> >       xtensa |                     radvd-2.12 | NOK |
> http://autobuild.buildroot.net/results/469d3e2f0c0739787b52e8497cf22a
> 1571d8a001 | ORPH
> > microblazeel |                     radvd-2.12 | NOK |
> http://autobuild.buildroot.net/results/24b2e2e515987cca86d2905f8cbcea
> 820755d526 | ORPH
> >       xtensa |                     radvd-2.12 | NOK |
> http://autobuild.buildroot.net/results/fa0c3393c2bcdbc2287c3b8a96cd16
> e2845a22a3 | ORPH
> >       xtensa |                     radvd-2.12 | NOK |
> http://autobuild.buildroot.net/results/d3796b9dbdaf93b6bfa66633d11172
> 9e0745c2c0 | ORPH
> >       x86_64 |               strongswan-5.4.0 | NOK |
> http://autobuild.buildroot.net/results/6120add5ad6e7f5d575fc2a2442cd7
> fe5302eb46 |
> >
> > --
> > http://autobuild.buildroot.net
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net <javascript:;>
> > http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170511/191d80dd/attachment.html>
