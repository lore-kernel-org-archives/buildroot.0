From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Date: Mon, 27 Jul 2015 09:15:41 +0200 (CEST)
Subject: [Buildroot] [PATCH v6 1/1] rtl8821au: new package
In-Reply-To: <CA+h8R2pQPtABif=URE-g--bpLNnyDJCZMBCi5jUaFUXWC9DJNQ@mail.gmail.com>
References: <1437691280-23926-1-git-send-email-christian@paral.in>
 <alpine.LNX.2.00.1507241546220.30794@localhost>
 <20150725161334.GI3662@free.fr>
 <alpine.LNX.2.00.1507262133400.12764@T520.local>
 <CA+h8R2pQPtABif=URE-g--bpLNnyDJCZMBCi5jUaFUXWC9DJNQ@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1507270914040.5678@T520.work>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Jul 2015, Christian Stewart wrote:
Hi,

I've done a quick test during my coffee break ...

> That's a bit odd. When loading the driver as-is from your repository
> without any arguments, I get a very verbose amount of logging to the kernel
> logs. Are you sure this is the case? With the patch in the merged
> repository most of the debugging is disabled through header define comments.
> 
> 

I missed some old dev_info() in rtl8821au/.
Now changed.
Pushed.

Ulli
