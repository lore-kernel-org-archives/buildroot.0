From: Philippe Ney <philippe.ney@pardes.ws>
Date: Thu, 26 Oct 2006 21:26:14 +0200
Subject: [Buildroot] Error building arm toolchain: undefined reference
 to `raise'
In-Reply-To: <1161855909.454083a599a48@edna.homeip.net>
References: <1161855909.454083a599a48@edna.homeip.net>
Message-ID: <20061026212614.a050f468.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
> I'm trying to build an up to date toolchain for our arm920t board, at91rm9200.
> However compilation fails with a:
[...]
> /home/tor/tmp/buildroot/toolchain_build_arm/gcc-4.1.1/gcc/config/arm/lib1funcs.asm:1000:
> undefined reference to `raise'
[...]
> Am i missing something here?
> 
> Regards
> 
> /Tor

Hi,

Have a look at the gumstix buildroot (www.gumstix.org) for a patch called
uClibc-gcc-41-raise-error.patch, I think this will do the trick.

Philippe
