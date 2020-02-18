From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 17:02:57 +0100
Subject: [Buildroot] Add BR2_EXTRA_CXX_FLAGS to be appended to
 TARGET_CXXFLAGS
In-Reply-To: <ea-mime-5e4bb22b-5970-2e2a6b21@www-2.mailo.com>
References: <ea-mime-5e4bb22b-5970-2e2a6b21@www-2.mailo.com>
Message-ID: <20200218170257.2aa2740b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis-Paul,

On Tue, 18 Feb 2020 10:45:15 +0100 (CET)
lpdev at cordier.org wrote:

> I see 2 possible solutions to solve that:
> 
> - at the buildroot build level, add an option like BR2_USE_CXX11_ABI, or more generally, BR2_EXTRA_CXX_FLAGS (that can be extended to cflags as well).
> - at the buildroot toolchain build level, add an option in the buildroot toolchain that allows to control the CXX11 ABI
> 
> What do you think about that?

The BR2_TARGET_OPTIMIZATION is already there to allow passing some
custom CFLAGS. It doesn't work for you ?

(And yes the name of the option is stupid, but it's some historical
thing, and we never renamed it).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
