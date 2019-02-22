From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Feb 2019 21:43:58 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/reaver: fix static build on m68k
In-Reply-To: <20190222213731.6890cc9d@windsurf>
References: <20190222201234.8340-1-fontaine.fabrice@gmail.com>
 <20190222213731.6890cc9d@windsurf>
Message-ID: <CAPi7W82n9Mr87BuaAssqe86Oy+xxe9--ch3T76ikrm22MM-iqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le ven. 22 f?vr. 2019 ? 21:37, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Fri, 22 Feb 2019 21:12:34 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/935c038b921ffa0f185571de41223e4c201e964b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> How is this related to static linking ? It seems to be a m68k issue
> that would also occur when dynamic linking (if m68k had support for
> that).
Indeed, I'll update the title.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
