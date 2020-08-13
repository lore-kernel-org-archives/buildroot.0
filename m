From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Aug 2020 00:43:47 +0200
Subject: [Buildroot] [PATCH v2 5/5]
 support/testing/test/toolchain/test_external_bootlin: new test cases
In-Reply-To: <20200809193818.1139805-6-thomas.petazzoni@bootlin.com>
References: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
 <20200809193818.1139805-6-thomas.petazzoni@bootlin.com>
Message-ID: <d259ac38-b6f4-5d4c-73cf-b54b94e964c5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 09/08/2020 ? 21:38, Thomas Petazzoni a ?crit?:
> This commit adds the new test cases generated automatically by the
> bl-toolchains-gen script, to test the integration of the Bootlin
> toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../tests/toolchain/test_external_bootlin.py  | 2354 +++++++++++++++++
>  1 file changed, 2354 insertions(+)
>  create mode 100644 support/testing/tests/toolchain/test_external_bootlin.py
> 

https://gitlab.com/kubu93/buildroot/-/pipelines/177698086

Tested-by: Romain Naour <romain.naour@gmail.com>

Note: check-flake8 failed:

$ python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
support/scripts/pkg-stats:504:9: E999 SyntaxError: invalid syntax

But the issue is already handled by another patch series:

http://patchwork.ozlabs.org/project/buildroot/list/?series=195235

Best regards,
Romain
