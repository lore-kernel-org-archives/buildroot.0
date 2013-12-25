From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:33:35 +0100
Subject: [Buildroot] [PATCH] binutils: do not allow on NIOS2,
 no support available
In-Reply-To: <1387737088-15963-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1387737088-15963-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131225123335.36219b0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sun, 22 Dec 2013 19:31:28 +0100, Thomas Petazzoni wrote:
> binutils does not have support for NIOS2 on the target, so disable the
> selection of binutils on this architecture.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/40d/40d9cbefd03727af82610412ed0bc47674c44dbb/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/Config.in  | 2 +-
>  package/dropwatch/Config.in | 2 +-
>  package/oprofile/Config.in  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
