From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Apr 2017 06:35:31 +0300
Subject: [Buildroot] [PATCH] package/xen: Use POSIX complaint header
 includes
In-Reply-To: <20170417231457.2691-1-alistair.francis@xilinx.com>
References: <20170417231457.2691-1-alistair.francis@xilinx.com>
Message-ID: <20170418033531.klfwusvs6ruu2x6b@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alistair,

On Mon, Apr 17, 2017 at 04:14:57PM -0700, Alistair Francis wrote:
> To fix build issues when using the musl library use POSIX compatible
> library inclues.

Is there any build failure or run time issue that these patches are fixing?

It would be nice to have build warnings dealt with upstream to have a clean 
build. But Buildroot doesn't carry patches for the sole purpose of fixing 
build time warnings.

When build warnings break the build because of -Werror, we either add 
-Wno-error, or patch out the -Werror to fix the build.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
