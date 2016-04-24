From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:40:22 +0200
Subject: [Buildroot] [PATCH v2 2/7] linux-firmware: add support for
 intel iwlwifi 7265D
In-Reply-To: <1461077048-16189-3-git-send-email-gustavo@zacarias.com.ar>
References: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
 <1461077048-16189-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160424234022.20bfb2df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 11:44:03 -0300, Gustavo Zacarias wrote:
> It selects 7265 non-D firmware since they share the same firmware for
> old kernel versions (rev 10 D-variant is the same as rev 10 non-D).

This explanation would have been good above the "select", so I've added
a quick comment there and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
