From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:28:42 +0200
Subject: [Buildroot] [PATCH] support/testing: test_hardening fix flake8
 whitespace
In-Reply-To: <20181020152247.17493-1-matthew.weber@rockwellcollins.com>
References: <20181020152247.17493-1-matthew.weber@rockwellcollins.com>
Message-ID: <20181020172842.48b656be@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Oct 2018 10:22:47 -0500, Matt Weber wrote:
> Resolves:
> support/testing/tests/core/test_hardening.py:25:42: E231 missing whitespace after ','
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/tests/core/test_hardening.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
