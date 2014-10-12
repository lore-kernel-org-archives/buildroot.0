From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Oct 2014 18:18:02 +0200
Subject: [Buildroot] libdaemons localstatedir /usr/var
In-Reply-To: <20141012181317.6ad4ba95@free-electrons.com>
References: <5439D19D.2030706@posteo.de>	<20141012091818.04db85ae@free-electrons.com>	<543A4928.5080901@posteo.de>	<543A7D79.7010008@mind.be>	<543AA492.2080907@posteo.de>
 <20141012181317.6ad4ba95@free-electrons.com>
Message-ID: <543AA9BA.5020807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/14 18:13, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Sun, 12 Oct 2014 17:56:02 +0200, J?rg Krause wrote:
>
> >>>      Bizarre things on the allyespackageconfig build
> >>>      (http://lists.busybox.net/pipermail/buildroot/2013-May/071856.html)
> >>   +1 to making it a global pkg-autotools option. J?rg, care to prepare a patch
> >> for that? Removing the existing --localstatedir should be a separate patch
> then.
> >
> > I will prepare a patch for this. Should I add this to host configure,
> > too? I guess so...
>
> If you add that to host configure, it should be $(HOST_DIR)/var.

 But I don't think that there's any host package that does anything
useful with the localstatedir.

 Regards,
 Arnout

>
> Thomas
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
