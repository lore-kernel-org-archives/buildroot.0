From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Apr 2014 19:28:58 +0000
Subject: [Buildroot] [PATCH 2/4] gdb: arc: bump to git commit 816890e
In-Reply-To: <535EA9E5.5010909@mind.be>
References: <1398703406-12157-1-git-send-email-Anton.Kolesov@synopsys.com>
 <1398703406-12157-2-git-send-email-Anton.Kolesov@synopsys.com>
 <535EA9E5.5010909@mind.be>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356CC0DC5@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Yes, it has a tag, and I agree it looks much better than commit id (it is arc-4.8-R3). I will redo my patches with the tag.

Anton


> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: 28 April 2014 23:20
> To: Anton Kolesov; buildroot at uclibc.org
> Cc: Alexey Brodkin
> Subject: Re: [Buildroot] [PATCH 2/4] gdb: arc: bump to git commit 816890e
> 
> On 28/04/14 18:43, Anton Kolesov wrote:
> > This revision corresponds to the 4.8-R3 release of the ARC GNU Tool chain.
> 
>  Does that happen to have a tag in the repository? A tag looks nicer in
> the build directory (gcc-final-4.8-R3 rather than
> gcc-final-cb15acc5eecea46d041730e5c2c9fa1d4283ef25).
> 
> 
>  Regards,
>  Arnout
> 
> >
> > Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> > Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> > ---
> >  package/gdb/Config.in.host | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> > index cbcec18..cf01b94 100644
> > --- a/package/gdb/Config.in.host
> > +++ b/package/gdb/Config.in.host
> > @@ -51,7 +51,7 @@ config BR2_GDB_VERSION
> >  	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
> >  	default "6.7.1-avr32-2.1.5" if
> BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
> >                                     (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
> > -	default "cb15acc5eecea46d041730e5c2c9fa1d4283ef25" if BR2_arc
> > +	default "816890e5d1685c957bf7ae03c304246619e77882" if BR2_arc
> >  	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if
> BR2_microblaze
> >  	default "7.4.1"    if BR2_GDB_VERSION_7_4
> >  	default "7.5.1"    if BR2_GDB_VERSION_7_5 ||
> !BR2_PACKAGE_HOST_GDB
> >
> 
> 
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
