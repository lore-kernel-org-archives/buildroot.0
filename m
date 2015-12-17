From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:49:55 +0100
Subject: [Buildroot] [PATCH v2] sysvinit: arm64 build fix
In-Reply-To: <875368a848cb37f12c0c13638c987ce0f7783700.1442850883.git.jpinto@synopsys.com>
References: <875368a848cb37f12c0c13638c987ce0f7783700.1442850883.git.jpinto@synopsys.com>
Message-ID: <20151217234955.3d27d823@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Pinto,

On Wed, 16 Dec 2015 15:21:38 +0000, Joao Pinto wrote:
> sysvinit was not able to be built for arm64 architectures.
> The package patch was changed according to the suggestion of 
> Thomas Petazzoni.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  package/sysvinit/0001-fix-libcrypt-test.patch | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
