From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 16:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/selinux: fix circular dependency
In-Reply-To: <20200421163546.321335bf@windsurf.home>
References: <20200421094849.2476332-1-fontaine.fabrice@gmail.com>
 <20200421163546.321335bf@windsurf.home>
Message-ID: <CAPi7W82J7f=Aj=YnoAdATErYYaKECLBKiW7yXi1nW9Ugoo2qgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le mar. 21 avr. 2020 ? 16:35, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Tue, 21 Apr 2020 11:48:49 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix circular dependency added by commit
> > 791292c48d5165515ca08f35d8cbc1ef78d3ed95
>
> Could you give more details about the circular dependency? How is
> changing a "select" by a "depends on" going to fix it? Especially since
> the select was in fact already there, just conditional on
> !BR2_PACKAGE_PYTHON.
Indeed, you're right this is not a circular dependency, I'll send a v2
with a correct commit message
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
