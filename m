From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 21:32:06 +0100
Subject: [Buildroot] [PATCH v2,1/2] ngrep: bump to version 1.47
In-Reply-To: <20181104121427.14889-1-fontaine.fabrice@gmail.com>
References: <20181104121427.14889-1-fontaine.fabrice@gmail.com>
Message-ID: <20181104213206.649a4aee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Nov 2018 13:14:26 +0100, Fabrice Fontaine wrote:
> - Switch site from sourceforge to github as there is no new releases on
>   sourceforge and http://ngrep.sourceforge.net/ is redirected to
>   https://github.com/jpr5/ngrep/
> - Remove first patch, not needed since version 1.46 and
>   https://github.com/jpr5/ngrep/commit/997c9d81d34d3a6646e6c5e363645015e644b3de
>   as this commit added the support for system pcre
> - Remove second patch, not needed since version 1.46 and
>   https://github.com/jpr5/ngrep/commit/2d8fd9ac7ef1ac6947f738f6005e7b533654f331
> - Remove third patch and LIBS=-lpcap -lpcre, not needed since 1.46 and
>   https://github.com/jpr5/ngrep/commit/cca6e3121f2d80dd32a5a33dead9495fe40eed70
> - LICENSE.txt has been renamed to LICENSE since version 1.47 and
>   https://github.com/jpr5/ngrep/commit/3cb4c580a9de4afe11c2c17b0f354b59b74ae974
> - Add an upstream patch to fix --enable-pcre: keep pcre as a mandatory
>   dependency as this is the current behavior in version 1.45. PCRE will
>   made optional in an other patch
> - Remove --with-pcre which is not recognized anymore
> - Add two other patches to fix --disable-tcpkill
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add --disable-tcpkill
>  - Remove NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
