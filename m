From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2015 11:52:24 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add hash for 2012.07
In-Reply-To: <20150428100357.634cf24c@free-electrons.com>
References: <1430078172-8136-1-git-send-email-vincent.stehle@laposte.net>
 <20150426222755.437ae3fe@free-electrons.com> <20150426213341.GI4809@free.fr>
 <20150428100357.634cf24c@free-electrons.com>
Message-ID: <FEF602B3-BD99-4F14-B778-BD035DF101FD@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On April 28, 2015 10:03:57 AM GMT+02:00, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Dear Yann E. MORIN,
>
>On Sun, 26 Apr 2015 23:33:41 +0200, Yann E. MORIN wrote:
>
>> > The problem indeed exists, but this is not the right solution. The
>> > right solution is to use BR_NO_CHECK_HASH_FOR. Yann, can you look
>at
>> > all the packages that may use custom versions (U-Boot, Barebox,
>> > kernel, etc.) and do the necessary BR_NO_CHECK_HASH_FOR handling?
>> 
>> I'll have a look.
>
>Any updates on this? One quick option I see is to remove uboot.hash for
>now.
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Free Electrons
>Embedded Linux, Kernel and Android engineering
>http://free-electrons.com

Thomas, all,

Just a quick answer: yes, I have changes for a bunch of packages
that I'll submit this evening when back home.

Regards,
Yann E. MORIN.
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150428/99785a2c/attachment.html>
