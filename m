From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 13:06:12 +0100
Subject: [Buildroot] [PATCH 1/1] Add newer Atom CPUs as Silvermont
 Architecture target
In-Reply-To: <20171024122206.24616-1-norbert.lange@andritz.com>
References: <20171024122206.24616-1-norbert.lange@andritz.com>
Message-ID: <20180101130612.3abf928e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Oct 2017 14:22:06 +0200, Norbert Lange wrote:
> The old Atom target is not really fitting for recent Atom CPUs
> based on Silvermont, Airmont or Goldmont. Those have more in
> common with older Desktop CPUs than old Atoms.
> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  arch/Config.in.x86         | 11 +++++++++++
>  package/openblas/Config.in |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
