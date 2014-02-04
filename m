From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 10:08:04 +0100
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <CAEqQue1m_d_ouJMoHqzjyvWawHFry_1C9S39E=1AeyJqFD6R9Q@mail.gmail.com>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
 <20140130200821.2c0559d8@skate>
 <CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>
 <20140131090444.725c88d4@skate>
 <CAEqQue1m_d_ouJMoHqzjyvWawHFry_1C9S39E=1AeyJqFD6R9Q@mail.gmail.com>
Message-ID: <52F0ADF4.8080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/01/14 12:09, servo gmrt wrote:
> I am trying to build integrated linux-kernal, rootfs, and rtai, 
> 
> To complie rtai, I enabled rtai and patch location in .config file. Other
> than that I have not made any changes in any of the buildroot files.
> 
> Is there any changes I should make in buoldroot before buliding RTAI ?

 The RTAI version we have in buildroot is RTAI 3.8.1. So if you are
building RTAI 4.0, it means you are using a fork. So either you have to
contact the maintainer of your fork, or you have to give us the patches
that were applied in order to use RTAI 4.0.

 Regards,
 Arnout

> 
> Thanks & Regards,
> B.Thiyagarajan
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
