From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 16:22:16 +0200
Subject: [Buildroot] [PATCH v3] configs/stm32f4xx: use kernel version
 4.11
In-Reply-To: <1496234729-31091-1-git-send-email-christophe.priouzeau@st.com>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <1496234729-31091-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <20170531162216.35f4c86e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 12:45:32 +0000, Christophe PRIOUZEAU wrote:

> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y

You're still removing those lines. Please keep them, but update them to
4.11.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
