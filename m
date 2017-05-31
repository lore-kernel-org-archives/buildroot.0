From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 15:02:18 +0200
Subject: [Buildroot] [PATCH v2] configs/stm32f4xx: use kernel version
 4.11
In-Reply-To: <80bd9893-9e75-37c1-76f5-69c0501558f4@st.com>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <1496128932-30283-1-git-send-email-christophe.priouzeau@st.com>
 <20170530234706.2c234f37@free-electrons.com>
 <80bd9893-9e75-37c1-76f5-69c0501558f4@st.com>
Message-ID: <20170531150218.66a8217d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I don't know how you have configured your Thunderbird, but the plain
text version of the e-mails is bogus, as Thunderbird does not quote the
text you're replying to. Could you try to fix your Thunderbird
configuration? This will make your e-mail replies "acceptable" for
open-source related mailing lists.

On Wed, 31 May 2017 12:42:17 +0000, Christophe PRIOUZEAU wrote:

> Sorry, for the second revision which are not complete, I push a new one.

Great, thanks.

> A little question about the kernel strategy on buildroot.
> 
> Do you prefer to use a specific kernel version or we can point on latest kernel (supported by buildroot if you don't apply patch on it) ?

Our policy is to use a specific/fixed kernel and bootloader version in
our defconfig, that we know has been tested by the contributor
adding/updating the defconfig. That's exactly why I asked you to point
to 4.11 specifically rather than just use the "latest kernel" option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
