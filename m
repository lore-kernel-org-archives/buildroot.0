From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 18:20:42 +0100
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <5128BCD8.5030807@petroprogram.com>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130216030625.04d9545d@skate> <5128A8C4.6040804@petroprogram.com>
 <5128BA82.1080501@mind.be> <5128BCD8.5030807@petroprogram.com>
Message-ID: <5128FA6A.3020802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/13 13:58, Stefan Fr?berg wrote:
> Yes, that adns-1.4-cnamechain.patch is originally from their mailing
> list but Gentoo hosts it too:
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-libs/adns/files/adns-1.4-cnamechain.patch
>
> However, here's the problem:
> As you can see that cnamechain patch is patch level -p0
> But those others patches are not.
>
> Even worse, that adns-1.4-rh514838.patch (patch level -p1) is extracted
> from Fedora src.rpm file.
>
> And that adns-1.4-destdir.patch, AFAIK, can only be located from here
> (and is also patch level -p0)
> https://build.opensuse.org/package/view_file?file=adns-1.4-destdir.patch&package=adns&project=devel%3Alibraries%3Ac_c%2B%2B
>
> So it's a mess and I don't think using direct download method will ever
> work for this complete patch set.

  In that case, keep it in the buildroot tree but clean up the redundant 
stuff -- I'll flag in the original commit where the redundant stuff is.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
