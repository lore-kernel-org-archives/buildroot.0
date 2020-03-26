From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:24:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version
 5.3.1
In-Reply-To: <20200326100404.82191-1-james.hilliard1@gmail.com>
References: <20200326100404.82191-1-james.hilliard1@gmail.com>
Message-ID: <20200326222429.20cb5abf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 04:04:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyyaml/python-pyyaml.hash | 6 +++---
>  package/python-pyyaml/python-pyyaml.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
> index e0d182bcbb..1161ae1021 100644
> --- a/package/python-pyyaml/python-pyyaml.hash
> +++ b/package/python-pyyaml/python-pyyaml.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/PyYAML/json
> -md5	adbb0d336b509d6472d3b095a0f1cf30  PyYAML-5.3.tar.gz
> -sha256	e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615  PyYAML-5.3.tar.gz
> +md5  d3590b85917362e837298e733321962b  PyYAML-5.3.1.tar.gz
> +sha256  b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d  PyYAML-5.3.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256	a2adb9c959b797494a0ef80bdf60e22db2749ee3e0c0908556e3eb548f967c56  LICENSE
> +sha256  a2adb9c959b797494a0ef80bdf60e22db2749ee3e0c0908556e3eb548f967c56  LICENSE

It was good to update the indentation here... but you forgot to update
the hash itself, as the LICENSE file changed!

I updated this, explained what the LICENSE file change was in the
commit log, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
