From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:16:35 +0200
Subject: [Buildroot] [PATCH v4] configs/stm32f4xx: use kernel version
 4.11
In-Reply-To: <1496301611-12538-1-git-send-email-christophe.priouzeau@st.com>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <1496301611-12538-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <20170608231635.2da07df6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Jun 2017 07:20:13 +0000, Christophe PRIOUZEAU wrote:
> Use kernel 4.11 for stm32f4 discovery board
> (stm32f429i-disco and stm32f469i-disco).
> 
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
> Changes v1 -> v2:
>  - change the commit header (suggested by Thomas)
> Changes v2 -> v3
>  - use LINUX_KERNEL_CUSTOM_VERSION_VALUE instead ofLINUX_KERNEL_LATEST_VERSION (suggested by Thomas)
> Changes v3 -> v4
>  - use linux header of kernel 4.11 (suggested by Thomas)

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
