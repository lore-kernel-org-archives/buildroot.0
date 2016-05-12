From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 12 May 2016 19:07:15 +0200
Subject: [Buildroot] uClibc debug symbols
In-Reply-To: <2dbe4eba-67f7-c8c5-1551-b8a31439b6c6@brickedbrain.com>
References: <ddfc826b-9bf7-38c8-a442-bea33bf05621@brickedbrain.com>
 <20160511233304.2c528c3b@gmx.net>
 <38268c60-77cb-a127-4d16-35ea58fc5766@brickedbrain.com>
 <20160512154148.66906dd2@free-electrons.com>
 <2dbe4eba-67f7-c8c5-1551-b8a31439b6c6@brickedbrain.com>
Message-ID: <20160512170714.GV26720@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Luca Ellero wrote,

> Can you please suggest a way to check whether binaries have debugging
> symbols? So, maybe, we can send patches.
> 
> I've tried:
> objdump -h ... | grep debug
> but it doesn't seem to always behave reliably.
> 
> Thank you

Just 'file' should do the job,
 best regards
  Waldemar
