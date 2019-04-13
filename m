From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:02:50 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add test to verify
 'scp' download via BR2_PRIMARY_SITE
In-Reply-To: <20190215213549.8476-1-patrickdepinguin@gmail.com>
References: <20190215213549.8476-1-patrickdepinguin@gmail.com>
Message-ID: <20190413220250.21437d01@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 15 Feb 2019 22:35:48 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Recently it was found that the scp download infrastructure was broken.
> To avoid future failures, create a test that verifies that the scp command
> receives the expected arguments.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  .../tests/download/br2-external/scp/Config.in |  0
>  .../download/br2-external/scp/external.desc   |  1 +
>  .../download/br2-external/scp/external.mk     |  1 +
>  .../br2-external/scp/package/nohash/nohash.mk | 10 +++
>  support/testing/tests/download/scp-wrapper    | 62 +++++++++++++++++++
>  support/testing/tests/download/test_scp.py    | 45 ++++++++++++++
>  6 files changed, 119 insertions(+)
>  create mode 100644 support/testing/tests/download/br2-external/scp/Config.in
>  create mode 100644 support/testing/tests/download/br2-external/scp/external.desc
>  create mode 100644 support/testing/tests/download/br2-external/scp/external.mk
>  create mode 100644 support/testing/tests/download/br2-external/scp/package/nohash/nohash.mk
>  create mode 100755 support/testing/tests/download/scp-wrapper
>  create mode 100644 support/testing/tests/download/test_scp.py

You got some review/comments from Ricardo, which I believe are not too
difficult to address. Do you think you will have the chance to address
them and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
