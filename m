From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 24 Aug 2011 13:13:12 -0400
Subject: [Buildroot] License for patches
In-Reply-To: <j33814$hoj$1@dough.gmane.org>
References: <4E5517E0.30003@finalbit.de>
 <201108241205.23310.vapier@gentoo.org> <j33814$hoj$1@dough.gmane.org>
Message-ID: <201108241313.13007.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 24, 2011 12:14:28 Grant Edwards wrote:
> On 2011-08-24, Mike Frysinger <vapier@gentoo.org> wrote:
> > On Wednesday, August 24, 2011 11:25:20 Lars Reemts wrote:
> >> Which license is relevant for the package specific patches distributed
> >> by buildroot? Formally it must be the GPL.
> > 
> > says who ?  i dont see the logic here.
> 
> According to http://buildroot.uclibc.org/:
> 
>   Buildroot is a set of Makefiles and patches [....]
> 
>   Buildroot is [...] licensed under the GNU GENERAL PUBLIC LICENSE V2
>   (Or later).
> 
> Seems pretty clear to me: the patches are under the GPL.

pretty sure that wasnt generally the intention.  the patches to packages 
should be under the same license as the packages they patch.

the build system itself (the set of makefiles and such) are under the GPL.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110824/02420a05/attachment.asc>
