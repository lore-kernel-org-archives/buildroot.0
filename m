From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:41:40 +0200
Subject: [Buildroot] [PATCH] support/testing/tests: drop Python 2.x test
 in test_ipython
In-Reply-To: <20190513184710.19747-1-thomas.petazzoni@bootlin.com>
References: <20190513184710.19747-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190518224140.0c336f7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 May 2019 20:47:10 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Since commit 6ebaef3818d6e3dc821616a33391eb6d594a053e
> ("package/python-ipython: bump to version 7.4.0"), ipython is no
> longer available for Python 2.x, as it requires Python 3.x.
> 
> However, the corresponding test case that was testing iPython under
> Python 2.x was not removed at the same time, causing a failure of
> TestIPythonPy2 test. Let's drop the test that is no longer relevant.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/210208754
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .gitlab-ci.yml                                |  1 -
>  support/testing/tests/package/test_ipython.py | 14 --------------
>  2 files changed, 15 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
