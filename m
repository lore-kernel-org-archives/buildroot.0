From: Antoine Tenart <atenart@kernel.org>
Date: Thu, 28 Jan 2021 15:22:14 +0100
Subject: [Buildroot] [PATCH 0/9] packages: Add more SELinux modules to
 some packages
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <161184373464.5198.1961212083736330725@kwain.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

Quoting Maxime Chevallier (2021-01-28 10:27:48)
> 
> This series is a second batch of patches adding a match between packages
> and their corresponding module in the SELinux refpolicy.
> 
> This series focuses on the following packages : 
> 
>  - alsa-utils (for alsa-ctl)
>  - bridge-utils (for brctl)
>  - dmidecode
>  - hwloc
>  - kexec and kexec-lite
>  - kismet
>  - logrotate
>  - mcelog
> 
> Maxime Chevallier (9):
>   package/alsa-utils: add SELinux repolicy module
>   package/bridge-utils: add SELinux refpolicy module
>   package/dmidecode: add SELinux refpolicy module
>   package/hwloc: add SELinux refpolicy module
>   package/kexec: add SELinux refpolicy module
>   package/kexec-lite: add SELinux refpolicy module
>   package/kismet: add SELinux refpolicy module
>   package/logrotate: add SELinux refpolicy module
>   package/mcelog: add SELinux refpolicy module

LGTM, thanks!

Antoine
