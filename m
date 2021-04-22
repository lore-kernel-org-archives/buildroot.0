From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:36:32 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/python-gpiozero: bump
 version to 1.6.2
In-Reply-To: <20210409211258.32652-2-ps.report@gmx.net>
References: <20210409211258.32652-1-ps.report@gmx.net>
 <20210409211258.32652-2-ps.report@gmx.net>
Message-ID: <20210422213632.0f526b35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Apr 2021 23:12:58 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change to python3 only (runtime dependency python-colorzero)
> 
> - update license file hash:
>   @@ -1,3 +1,5 @@
>   +SPDX-License-Identifier: BSD-3-Clause
>   +
> 
> - add setuptools runtime dependency, fixes:
> 
> 	$ pinout -r a020d3 -m
> 	Traceback (most recent call last):
> 	  File "/usr/bin/pinout", line 6, in <module>
> 	    from pkg_resources import load_entry_point
> 	ModuleNotFoundError: No module named 'pkg_resources'
> 
> For details see [1].
> 
> [1] https://gpiozero.readthedocs.io/en/stable/changelog.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-gpiozero/Config.in            | 2 ++
>  package/python-gpiozero/python-gpiozero.hash | 4 ++--
>  package/python-gpiozero/python-gpiozero.mk   | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
