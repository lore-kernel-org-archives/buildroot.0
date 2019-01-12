From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jan 2019 16:49:40 +0100
Subject: [Buildroot] [PATCH 1/1] sunxi-cedarx: needs -fPIC
In-Reply-To: <20190112145541.316d0b60@windsurf.home>
References: <20190112092459.21382-1-fontaine.fabrice@gmail.com>
 <20190112145541.316d0b60@windsurf.home>
Message-ID: <CAPi7W81_Kxh=51Te+FSNjMM7PmHnQxh=S6inubTD1jVauv9MPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le sam. 12 janv. 2019 ? 14:55, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat, 12 Jan 2019 10:24:59 +0100, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/c17062e1558f26c2db837883a0c33ef39dd031a2
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Could you explain why we are seeing such build errors since December
> 5th, 2018, while the package hasn't been touched since 2016 ? What
> changed that makes those errors visible now ?
Yes, the issue is raised only when BR2_OPTIMIZE_2 is set and
autobuilders test -O2 only since December 3rd:
https://git.buildroot.net/buildroot/commit/?id=aa556e2035c023d4328185a46e15df532e566067.
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
