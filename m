From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 16:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiio: fix install of C#
 bindings
In-Reply-To: <20200311212533.829423-1-fontaine.fabrice@gmail.com>
References: <20200311212533.829423-1-fontaine.fabrice@gmail.com>
Message-ID: <20200425162328.1cb6e25c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 22:25:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libiio-sharp.dll.mdb is not installed since version 0.19.0 and
> https://github.com/analogdevicesinc/libiio/commit/8b571969fa245fb25c6431340f23ff157e34841b
> 
> Indeed, EXISTS "${LIBIIO_CS_DLL}.mdb" will always return false because
> the file will not exist when cmake will create the makefiles.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/42ffbd07d0e998c75d1afde6a5db7d6418c10f45
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libiio/libiio.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
