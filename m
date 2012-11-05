From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 05 Nov 2012 10:38:04 +0100
Subject: [Buildroot] mesa3d:  "ImportError: No module named libxml2"
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
References: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
Message-ID: <509788FC.2050005@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 05/11/2012 10:18, Vellemans, Noel a ?crit :
> Hi all,
> 
> I've been test running/building a recent buildroot (git-version).. 
> 
> I do end up with this error while building mesa3d"  "ImportError: No
> module named libxml2" (ONLY if I do build into a clean-output
> directory!)
> 
> The strange thing is that when building for a second time it all builds
> fine.
>  
> Any clue where to look at? 

Could you post your configuration file and the complete failing build log?

Also, do you know what python interpreter it is actually using? The one
found in your distribution or host-python built by Buildroot?

Thanks.
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
