From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 22:51:59 +0200
Subject: [Buildroot] [PATCH] package/opencv3: fix build for x86_64 target
In-Reply-To: <20170504215333.4172-1-s.martin49@gmail.com>
References: <20170504215333.4172-1-s.martin49@gmail.com>
Message-ID: <20170511225159.00ddcb69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 May 2017 23:53:33 +0200, Samuel Martin wrote:
> This change backports a fix from upstream fixing missing symbols due to
> wrong compiler optimization flags.
> 
> On Buildroot side, also remove deprecated options passed on the
> configure command.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/af9/af950c6172a578c4eeeb9440b6990ceb48263fa6/build-end.log
>   http://autobuild.buildroot.net/results/e88/e8832302cd4f30cec076f67965f6aacbaca5b955/build-end.log
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  .../0001-cmake-support-multiple-CPU-targets.patch  | 2501 ++++++++++++++++++++
>  package/opencv3/opencv3.mk                         |   16 +-
>  2 files changed, 2502 insertions(+), 15 deletions(-)
>  create mode 100644 package/opencv3/0001-cmake-support-multiple-CPU-targets.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
