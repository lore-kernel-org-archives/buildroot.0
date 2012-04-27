From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 21:56:39 +0200
Subject: [Buildroot] Samba breakage on arm
In-Reply-To: <4F951690.7020604@free-electrons.com>
References: <4F9118BB.2010300@free-electrons.com>
 <201204211554.57989.arnout@mind.be> <4F951690.7020604@free-electrons.com>
Message-ID: <201204272156.40163.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 23 April 2012 10:45:04 Maxime Ripard wrote:
> Le 21/04/2012 15:54, Arnout Vandecappelle a ?crit :
> > On Friday 20 April 2012 10:05:15 Maxime Ripard wrote:
> >> Building samba with any CodeSourcery/Codebench toolchains except the
> >> 2011.09 will trigger either a compiler segfault or an internal compiler
> >> error.
> > 
> >  Seems to work for me, with Sourcery G++ 2011.03 on ARM...
> > 
> >  Which config did you have that doesn't work?
> > 
> >  BTW there is something we can do about it: disallow samba if a
> > non-working external toolchain is selected...
> > 
> >  Regards,
> >  Arnout
> > 
> 
> I attached the .config.

 Looks like it gives an ICE for generic arm, but it works fine for 
cortex-a8.  Can't explain why, but maybe you can work around it by 
selecting a more specific processor architecture.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
