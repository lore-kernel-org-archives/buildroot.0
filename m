From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jul 2017 16:50:26 +0200
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <bbae61aa-7e81-21b6-d7f8-2489b39e2893@imgtec.com>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
 <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
 <1501150411.21202.1.camel@embedded.rocks>
 <bbae61aa-7e81-21b6-d7f8-2489b39e2893@imgtec.com>
Message-ID: <20170727165026.4a5f59a1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Jul 2017 11:19:02 +0100, Vicente Olivert Riera wrote:

> >> shouldn't we add a "package/pkg-meson.mk" file and then use "$(eval
> >> $(meson-package))" for Meson packages?  
> > 
> > Maybe, if there are more than one package. At least, that was the
> > opinion of Yann when he reviewed the patch last year.  
> 
> There will be more packages moving to Meson, and some of them quite
> important: http://mesonbuild.com/Users.html
> 
> I think we should add proper Meson support in BR infra from the beginning.

No, let's wait to have a few Meson-based packages in Buildroot, and
then we'll have a package infrastructure. This will allow us to see
what are the commonalities, what are the differences, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
