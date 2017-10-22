From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 12:18:53 +0200
Subject: [Buildroot] [PATCH 07/12] go: bump version to 1.9
In-Reply-To: <20171019002257.27646-7-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-7-christian@paral.in>
Message-ID: <20171022121853.76ed4d85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 20:22:52 -0400, Christian Stewart wrote:
> Bumping Go to 1.9 from 1.7.
> 
> Go 1.8 comes with significant performance improvements, particularly
> around ARM: "CPU time required by our benchmark programs was reduced by
> 20-30% on 32-bit ARM systems."
> 
> Go 1.9 is required for docker-engine and other Go packages in Buildroot.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 4 ++--
>  package/go/go.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
