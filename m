From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 14:22:39 +0100
Subject: [Buildroot] [PATCH 9/12] package/mongodb: add boost mandatory
 dependency
In-Reply-To: <20190210140655.6b6ce932@windsurf.home>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
 <20190210114528.1753-9-fontaine.fabrice@gmail.com>
 <20190210140655.6b6ce932@windsurf.home>
Message-ID: <CAPi7W81_SdnBOb2qUXac4K614Wqmk9_+1whpps99UDe9vXXnaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le dim. 10 f?vr. 2019 ? 14:06, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sun, 10 Feb 2019 12:45:25 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I don't understand PATCH 9/12, 10/12 and 11/12. If those are mandatory
> dependencies, mongodb will not build after PATCH 8/12 is applied.
mongodb will build after patch 8/12 because it embeds all its external
dependencies in src/third_party. Path 9 to 12 enable the system
libraries instead of the embededded ones.

However, as suggested by Yann in a separate email, I'll create a
mongodb-4 package and put all the mongodb related changes in a single
"new mongodb-4 package" patch.
>
> Could you make sure this patch series is bisectable ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
