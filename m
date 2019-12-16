From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 23:37:39 +0100
Subject: [Buildroot] [PATCH/next 2/4] support/testing: add gitdb2 test
In-Reply-To: <20191129212910.2537303-2-aduskett@gmail.com>
References: <20191129212910.2537303-1-aduskett@gmail.com>
 <20191129212910.2537303-2-aduskett@gmail.com>
Message-ID: <20191216233739.2509a879@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Nov 2019 13:29:08 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Add a simple test case that imports the module.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied to master, after tweaking one thing.

> diff --git a/support/testing/tests/package/sample_python_gitdb2.py b/support/testing/tests/package/sample_python_gitdb2.py
> new file mode 100644
> index 0000000000..b5c43cd858
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_gitdb2.py
> @@ -0,0 +1,4 @@
> +# Taken from smmap/test/test_tutorial.py

This really smells like a bad copy/paste from the python-smmap2 test
script, so I dropped this line :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
