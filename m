From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 10:30:54 +0100
Subject: [Buildroot] [PATCH] toolchain: bump ARC prebuild toolchain to
 arc-2017.09
In-Reply-To: <20171218103621.11880-1-didin@synopsys.com>
References: <20171218103621.11880-1-didin@synopsys.com>
Message-ID: <20180109103054.40819bb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 13:36:21 +0300, Evgeniy Didin wrote:
> There might be subtle differences between uClibc configuration
> compared to Buildroot's one.
> 
> Native RPC now is disabled because uClinc-ng has removed it.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../toolchain-external-synopsys-arc/Config.in                  |  7 +++----
>  .../toolchain-external-synopsys-arc.hash                       | 10 +++++-----
>  .../toolchain-external-synopsys-arc.mk                         |  2 +-
>  3 files changed, 9 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
