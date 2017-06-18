From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 16:12:43 +0200
Subject: [Buildroot] [PATCH 2/4 v2] tools: move test-pkg out of
	support/scripts
In-Reply-To: <937e234aa28d4d11f676ce0c1437d2883cdd0f10.1497794488.git.yann.morin.1998@free.fr>
References: <cover.1497794488.git.yann.morin.1998@free.fr>
 <937e234aa28d4d11f676ce0c1437d2883cdd0f10.1497794488.git.yann.morin.1998@free.fr>
Message-ID: <20170618161243.04768757@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 16:01:43 +0200, Yann E. MORIN wrote:

>  docs/manual/adding-packages-tips.txt |  12 +--
>  support/scripts/test-pkg             | 198 +----------------------------------
>  tools/00-README.txt                  |   5 +
>  tools/test-pkg                       | 197 ++++++++++++++++++++++++++++++++++
>  4 files changed, 209 insertions(+), 203 deletions(-)
>  mode change 100755 => 120000 support/scripts/test-pkg
>  create mode 100755 tools/test-pkg

No strong opinion on whether such a move is desirable, but at the very
list I believe we should not add this 00-README.txt file. Nowhere else
in the tree we have files named like this, and I don't think we should
start adding these.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
