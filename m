From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 14:25:50 +0100
Subject: [Buildroot] [PATCH 1/2] csky: Add new architecture
In-Reply-To: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
References: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170304142550.77104dfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 09:20:20 +0800, Guo Ren wrote:
> This is a basic implement for C-SKY, we use pre-build-toolchain from
> url, and csky-toolchain open-source is on going.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  DEVELOPERS          |  3 +++
>  arch/Config.in      | 12 ++++++++++++
>  arch/Config.in.csky | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  toolchain/Config.in |  1 +
>  4 files changed, 61 insertions(+)
>  create mode 100644 arch/Config.in.csky

Applied to master, with some minor tweaks. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
