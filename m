From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2019 12:27:45 +0100
Subject: [Buildroot] [PATCH/next 2/4] support/testing: add gitdb2 test
In-Reply-To: <20191129212910.2537303-2-aduskett@gmail.com>
References: <20191129212910.2537303-1-aduskett@gmail.com>
 <20191129212910.2537303-2-aduskett@gmail.com>
Message-ID: <20191228122745.445e679a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Fri, 29 Nov 2019 13:29:08 -0800
aduskett at gmail.com wrote:

> new file mode 100644
> index 0000000000..b5c43cd858
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_gitdb2.py
> @@ -0,0 +1,4 @@
> +# Taken from smmap/test/test_tutorial.py
> +
> +from gitdb import *

This causes a flake8 warning:

support/testing/tests/package/sample_python_gitdb2.py:1:1: F403 'from gitdb import *' used; unable to detect undefined names

See https://lintlyci.github.io/Flake8Rules/rules/F403.html for more
details about this, and
https://gitlab.com/buildroot.org/buildroot/-/jobs/389451584 for the
GitlabCI job that reported this.

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
