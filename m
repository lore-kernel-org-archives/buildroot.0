From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:19:23 +0200
Subject: [Buildroot] [PATCH 1/1] go: bump version to 1.8.3
In-Reply-To: <20170530193613.27160-1-christian@paral.in>
References: <20170530193613.27160-1-christian@paral.in>
Message-ID: <20170530231923.0f3afa17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 12:36:13 -0700, Christian Stewart wrote:
> Bumping Go to 1.8.3 from 1.7.
> 
> Go 1.8 comes with significant performance improvements, particularly
> around ARM: "CPU time required by our benchmark programs was reduced by
> 20-30% on 32-bit ARM systems."
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
