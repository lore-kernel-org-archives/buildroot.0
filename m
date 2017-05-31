From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Wed, 31 May 2017 12:42:17 +0000
Subject: [Buildroot] [PATCH v2] configs/stm32f4xx: use kernel version
	4.11
In-Reply-To: <20170530234706.2c234f37@free-electrons.com>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <1496128932-30283-1-git-send-email-christophe.priouzeau@st.com>
 <20170530234706.2c234f37@free-electrons.com>
Message-ID: <80bd9893-9e75-37c1-76f5-69c0501558f4@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On 05/30/2017 11:47 PM, Thomas Petazzoni wrote:

Hello,

On Tue, 30 May 2017 07:22:36 +0000, Christophe PRIOUZEAU wrote:


Linux kernel support the two stm32f4 discovery board since
kernel 4.5 (stm32f429i-disco and stm32f469i-disco).

Use last kernel supported on buildroot for stm32f429 and
stm32f469 board.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>



Could you please read entirely the review I did on your first version?
It seems like you fixed only the issue that was mentioned at the top of
my review, and didn't scroll through the entire e-mail.

Best regards,

Thomas


Sorry, for the second revision which are not complete, I push a new one.

A little question about the kernel strategy on buildroot.

Do you prefer to use a specific kernel version or we can point on latest kernel (supported by buildroot if you don't apply patch on it) ?


Regards

Christophe

--


Best regards / Cordialement,

[cid:part1.19ECA0AA.1161B9F7 at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170531/44a359e3/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170531/44a359e3/attachment.png>
