From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:58:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk and
 package/openjdk-bin: bump version to 12+33
In-Reply-To: <20190322141954.36060-1-aduskett@gmail.com>
References: <20190322141954.36060-1-aduskett@gmail.com>
Message-ID: <20190325195829.5314372c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Mar 2019 10:19:54 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Because one package relies on the other, bump both at the same time.
> 
> Other changes:
>  - Drop --with-cpu-port=aarch64 option as it is no longer a valid option.
>    (See https://openjdk.java.net/jeps/340)
>  - Add xlib_libXrandr as a dependency.
> 
> Tested with:
> ./support/testing/run-tests -s -o ./output/ -d dl tests.package.test_openjdk.TestOpenJdk
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
