From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 18:22:49 +0200
Subject: [Buildroot] [PATCH RESEND v2] imx6q-sabresd: Add a qt5
 defconfig variant
In-Reply-To: <CAOMZO5DxMd6+bvVxe9Q7gAJf+=i24YAJdDSs1RFfcC1sBB2V_g@mail.gmail.com>
References: <1498048346-1326-1-git-send-email-fabio.estevam@nxp.com>
 <20170621161937.1d14f804@windsurf.home>
 <CAOMZO5DxMd6+bvVxe9Q7gAJf+=i24YAJdDSs1RFfcC1sBB2V_g@mail.gmail.com>
Message-ID: <20170621182249.496cf83c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 12:18:18 -0300, Fabio Estevam wrote:

> On Wed, Jun 21, 2017 at 11:19 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > On Wed, 21 Jun 2017 09:32:26 -0300, Fabio Estevam wrote:
> >  
> >> +BR2_PACKAGE_MESA3D=y
> >> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
> >> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> >> +BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y  
> >
> > Just curious, why are you enabling the swrast drivers here?  
> 
> Good point: actually I don't need it.
> 
> Would you like to respin it without this option?

I can definitely remove them when applying, but I won't be able to do a
runtime test to verify that everything still works properly. So it
would probably be better if you could remove those lines, and verify
that things are still working as expected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
