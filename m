From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 09:24:43 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as
 contact for galileo_defconfig
In-Reply-To: <BN6PR11MB4145CB3739932D59E074FC1C90200@BN6PR11MB4145.namprd11.prod.outlook.com>
References: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
 <20191231152005.GH26395@scaer>
 <MN2PR11MB4160005AC798211088F160C090210@MN2PR11MB4160.namprd11.prod.outlook.com>
 <20200101163416.065d0ace@windsurf> <20200101161120.GL3519@scaer>
 <BN6PR11MB4145B63CE33025809CB99F8490210@BN6PR11MB4145.namprd11.prod.outlook.com>
 <20200101211657.GP3519@scaer> <20200102091439.37998851@windsurf>
 <BN6PR11MB4145CB3739932D59E074FC1C90200@BN6PR11MB4145.namprd11.prod.outlook.com>
Message-ID: <20200103092443.4e98511a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ray,

On Thu, 2 Jan 2020 21:21:35 +0000
"Kinsella, Ray" <ray.kinsella@intel.com> wrote:

> I had thought about that a few times, upgrading the kernel to the latest and greatest.
> 
> A good share of the Quark/X1000 SoC + Galileo Board support was upstreamed to the kernel.
> However some was not.
> 
> That out-of-tree 3.14 was the last version Intel engineers validated as supporting all the I/Os etc.
> So there is some unknown delta between the what is supported by the upstream and this out-of-tree kernels
> 
> If memory serves me the main difference was the SRAM drivers and some power management features.
> 
> Given this board is pretty old.
> I would be inclined to update it to the latest kernel, and we can see if anyone screams.
> No doubt we will be retiring it completely soon enough. 

Does it still make sense to have this Galileo defconfig? If I
understood correctly, this platform is no longer sold/supported by
Intel, so perhaps we should simply remove this defconfig, either now or
at some point in the future ?

> You guys heading to FOSDEM this year?

A number of Buildroot developers will indeed be at FOSDEM, since we
organize our Buildroot Developers meeting right after FOSDEM, see
https://elinux.org/Buildroot:DeveloperDaysFOSDEM2020.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
