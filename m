From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 05 Jul 2017 22:29:49 -0300
Subject: [Buildroot] [PATCH 3/3] testing/tests/package: add basic unit
 test for IPython
References: <20170704185807.27189-3-andrew.smirnov@gmail.com>
Message-ID: <595d928d38c77_78643fb7b09b4cd49818d@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2 nits below.

On Tue, Jul 04, 2017 at 03:58 PM, Andrey Smirnov wrote:

> +++ b/support/testing/tests/package/test_ipython.py
> @@ -0,0 +1,32 @@
> +import os
> +
> +import infra.basetest

These 2 imports are not used.

> +from tests.package.test_python import TestPythonBase
[snip]
> +        self.libc_time_test()
> +
> +
> -- 

These 2 empty lines at the end of file are not needed.

Regards,
Ricardo
