From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 20 Feb 2012 10:20:27 +0100
Subject: [Buildroot] [PATCH 2/2] Microblaze: added external toolchain
	from Xilinx
In-Reply-To: <201202200948.19050.arnout@mind.be>
References: <e00406c0e4c15d77b4d03badf312980cce713c06.1329651936.git.alvaro.gamez@hazent.com>
 <22621d522680079cb3b800f28a03d771a238f875.1329651936.git.alvaro.gamez@hazent.com>
 <201202200948.19050.arnout@mind.be>
Message-ID: <CAM+bi4tDvBOAEpbdaJ8c8XJ4LB6Y7scrWJD0cR8tYg5rTXUxCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No, sorry. The fact itself of storing a bunch of binaries tared inside a
git repository sounds itself a bit strange.
They have in fact two repositories, one for version1.0 and this one for
version2.0, so I guess they will create another one when they release a
future version; so this is the best we have.

2012/2/20 Arnout Vandecappelle <arnout@mind.be>

> On Sunday 19 February 2012 13:17:10 Alvaro G. M wrote:
> > +TOOLCHAIN_EXTERNAL_SITE=
> http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;hb=HEAD;f=
>
>  I don't really like the use of HEAD here, because it makes the build
> unreproducible.  Don't they have anything like release tags?
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120220/c73cad31/attachment.html>
