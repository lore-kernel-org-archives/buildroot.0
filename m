From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 23 Dec 2013 10:58:59 +0800
Subject: [Buildroot] [PATCH] atk: bump to version 2.11.4
In-Reply-To: <87txe1fbpg.fsf@dell.be.48ers.dk>
References: <1387699292.19488.1.camel@phoenix>
 <87txe1fbpg.fsf@dell.be.48ers.dk>
Message-ID: <CAFRkauC028FaUZ_BADdTd4sbc7qP__GRUOV1Went8VWQH0R-1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/22 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:
>
>  > Signed-off-by: Axel Lin <axel.lin@ingics.com>
>  > ---
>  >  package/atk/atk.mk | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/package/atk/atk.mk b/package/atk/atk.mk
>  > index 1a8bbea..fc65987 100644
>  > --- a/package/atk/atk.mk
>  > +++ b/package/atk/atk.mk
>  > @@ -4,8 +4,8 @@
>  >  #
>  >  ################################################################################
>
>  > -ATK_VERSION_MAJOR = 2.10
>  > -ATK_VERSION = $(ATK_VERSION_MAJOR).0
>  > +ATK_VERSION_MAJOR = 2.11
>  > +ATK_VERSION = $(ATK_VERSION_MAJOR).4
>
> odd minor version means development version. What is the reason we
> cannot stick to the current stable version?

Ah.. I didn't realize 2.11.4 is development version.
Please just drop this patch.

Regards,
Axel
