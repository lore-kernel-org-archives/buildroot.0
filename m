From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Apr 2012 00:01:40 +0200
Subject: [Buildroot] Help lpr and general package advice
In-Reply-To: <05e201cd2252$ffff8190$fffe84b0$@virgin.net>
References: <05e201cd2252$ffff8190$fffe84b0$@virgin.net>
Message-ID: <20120425000140.5e477e75@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

Le Tue, 24 Apr 2012 20:46:52 +0100,
"John X" <john.x@virgin.net> a ?crit :

> I'm relatively new to buildroot, so please bear with me, I've just created a
> build, which boots and provides me with most of the functionality I need,
> however, I've just run an application and I've received a message that it
> cannot find lpr
> 
> I've checked and as far as I can see it's in the busybox distro, 
> 
> I've done a make menuconfig and gone through the options, but cannot see
> where I can select the option so lpr is in my build, so I'm guessing its
> part of a larger package.
> 
> Where do I look to see what packages contain ?

A lightweight implementation of lpr is available in Busybox, but is not
enabled in the default Busybox configuration that Buildroot contains.

Do:

	make busybox-menuconfig

And then in "Print utilities", enable lpr.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
