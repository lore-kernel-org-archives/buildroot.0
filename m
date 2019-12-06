From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:19:01 +0100
Subject: [Buildroot] [PATCH 1/4] package/python-twisted: bump to version
 19.10.0
In-Reply-To: <20191205221515.3121562-1-aduskett@gmail.com>
References: <20191205221515.3121562-1-aduskett@gmail.com>
Message-ID: <20191206231901.27287efd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 14:15:12 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Tested with
> run-tests tests.package.test_python_twisted.TestPythonPy3Twisted -d ./dl -o ./o
> 
> Ran 1 test in 388.506s
> OK
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/python-twisted/python-twisted.hash | 4 ++--
>  package/python-twisted/python-twisted.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
