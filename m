From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:16:10 +0100
Subject: [Buildroot] [PATCH] gstreamer/gst-plugins-good correct patch
 0001-linux36.patch
In-Reply-To: <56682F61.90106@inbox.ru>
References: <56682F61.90106@inbox.ru>
Message-ID: <20151209231610.7e099e62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viacheslav,

On Wed, 9 Dec 2015 16:40:49 +0300, Viacheslav Volkov wrote:
> Supress warning message
> 
> >>> gst-plugins-good 0.10.31 Patching
> 
> Applying 0001-linux36.patch using patch:
> patching file sys/v4l2/gstv4l2bufferpool.c
> Hunk #1 succeeded at 181 with fuzz 2 (offset -1 lines).
>  
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>

I'm sorry but your patch doesn't apply on top of master, I believe
because it was line wrapped. Can you send it with 'git send-email'
instead, which ensures that your e-mail client does not mess up the
patch ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
