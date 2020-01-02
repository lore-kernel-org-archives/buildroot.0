From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:14:39 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as
 contact for galileo_defconfig
In-Reply-To: <20200101211657.GP3519@scaer>
References: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
 <20191231152005.GH26395@scaer>
 <MN2PR11MB4160005AC798211088F160C090210@MN2PR11MB4160.namprd11.prod.outlook.com>
 <20200101163416.065d0ace@windsurf> <20200101161120.GL3519@scaer>
 <BN6PR11MB4145B63CE33025809CB99F8490210@BN6PR11MB4145.namprd11.prod.outlook.com>
 <20200101211657.GP3519@scaer>
Message-ID: <20200102091439.37998851@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ray,

On Wed, 1 Jan 2020 22:16:57 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2020-01-01 21:08 +0000, Kinsella, Ray spake thusly:
> > Yup - a make clean and rebuild sorted it out.
> > 
> > So Yann/Thomas - what do you need someone to sign up to here?
> > Is a nightly build or a regular checkin or ... ?  
> 
> As I explained earlier, there is a weekly build of all the defconfigs on
> gitlab-ci [0], and when there is a failure, an automatic my is sent to
> whoever is registered in the DEVELOPPERS file for that defconfig.
> 
> So, that means no mail until there is a failure, and this is at most
> once a week, until the failure is fixed.

Another thing that can be done if you still have the Galileo hardware
available is to update the defconfig to use newer version of the
different components, i.e in this case the kernel: the defconfig uses
3.14, which is quite old now. There is no need to do that every week,
but doing that once a year or so is nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
