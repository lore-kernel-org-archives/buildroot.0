From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:47:06 +0200
Subject: [Buildroot] [PATCH v2] configs/stm32f4xx: use kernel version
 4.11
In-Reply-To: <1496128932-30283-1-git-send-email-christophe.priouzeau@st.com>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <1496128932-30283-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <20170530234706.2c234f37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 07:22:36 +0000, Christophe PRIOUZEAU wrote:
> Linux kernel support the two stm32f4 discovery board since
> kernel 4.5 (stm32f429i-disco and stm32f469i-disco).
> 
> Use last kernel supported on buildroot for stm32f429 and
> stm32f469 board.
> 
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>

Could you please read entirely the review I did on your first version?
It seems like you fixed only the issue that was mentioned at the top of
my review, and didn't scroll through the entire e-mail.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
