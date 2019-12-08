From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 8 Dec 2019 09:50:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/ytree: fix license
In-Reply-To: <87h82bjlv8.fsf@dell.be.48ers.dk>
References: <20191207212720.1301402-1-fontaine.fabrice@gmail.com>
 <87h82bjlv8.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81M3ygL=uv8ZZ4D87_ju+LXpKjLFA_Aju-L-EbLh8P8pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Le dim. 8 d?c. 2019 ? 08:51, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > License is GPL-2.0+ not GPL-2.0 as specified in files that contain
>  > license information: tilde.{h,c} and xmalloc.{h,c}
>
> ytree is messy. I have been in contact with the upstream developer to
> clarify this, and he ended up releasing a 2.0 tarball with no code
> changes, just the clarification that it is released under GPL-2.0+. That
> tarball unfortunately had some issues (including having a GPL-3.0 COPYING
> file rather than 2.0), which I pointed out but never heard back.
>
> I have just redownloaded the 2.0 tarball, and I see the COPYING file has
> been silently changed to 2.0, so perhaps a nicer solution would be to
> combine this license change with the bump to 2.0?
COPYING from current version (1.99pl2) is already a GPL-2.0 COPYING
file so I don't know when upstream made this change but for sure hash
of COPYING is the same in 1.99pl2 and 2.00.
>
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/ytree/ytree.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
>  > index d9716f93ba..379be1e8e0 100644
>  > --- a/package/ytree/ytree.mk
>  > +++ b/package/ytree/ytree.mk
>  > @@ -6,7 +6,7 @@
>
>  >  YTREE_VERSION = 1.99pl2
>  >  YTREE_SITE = https://www.han.de/~werner
>  > -YTREE_LICENSE = GPL-2.0
>  > +YTREE_LICENSE = GPL-2.0+
>  >  YTREE_LICENSE_FILES = COPYING
>  >  YTREE_DEPENDENCIES = ncurses
>
>  > --
>  > 2.24.0
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
