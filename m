From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:37:35 +0100
Subject: [Buildroot] [PATCH 06/10]
 support/testing/tests/core/test_cpeid: new test
In-Reply-To: <20201104145145.1316167-7-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-7-thomas.petazzoni@bootlin.com>
Message-ID: <20201126163735.0acf0685@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Nov 2020 15:51:40 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit adds a number of test cases to verify that the CPE_ID_*
> variables are properly handled by the generic package infrastructure
> and that the "make show-info" JSON output matches what we expect.
> 
> A total of 5 different example packages are used to exercise different
> scenarios of CPE_ID_* variables usage.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../tests/core/cpeid-br2-external/Config.in   |   0
>  .../core/cpeid-br2-external/external.desc     |   1 +
>  .../tests/core/cpeid-br2-external/external.mk |   1 +
>  .../package/cpe-id-pkg1/cpe-id-pkg1.mk        |   4 +
>  .../package/cpe-id-pkg2/cpe-id-pkg2.mk        |   3 +
>  .../package/cpe-id-pkg3/cpe-id-pkg3.mk        |   5 +
>  .../package/cpe-id-pkg4/cpe-id-pkg4.mk        |   9 ++
>  .../package/cpe-id-pkg5/cpe-id-pkg5.mk        |  16 +++
>  support/testing/tests/core/test_cpeid.py      | 109 ++++++++++++++++++
>  9 files changed, 148 insertions(+)
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/Config.in
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/external.desc
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/external.mk
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg1/cpe-id-pkg1.mk
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg2/cpe-id-pkg2.mk
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg4/cpe-id-pkg4.mk
>  create mode 100644 support/testing/tests/core/cpeid-br2-external/package/cpe-id-pkg5/cpe-id-pkg5.mk
>  create mode 100644 support/testing/tests/core/test_cpeid.py

Applied to next thanks to the Reviewed-by from Matt.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
