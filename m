From: Christian Stewart <christian@paral.in>
Date: Sun, 26 Jul 2015 22:45:41 +0000
Subject: [Buildroot] [PATCH v6 1/1] rtl8821au: new package
In-Reply-To: <alpine.LNX.2.00.1507262133400.12764@T520.local>
References: <1437691280-23926-1-git-send-email-christian@paral.in>
 <alpine.LNX.2.00.1507241546220.30794@localhost>
 <20150725161334.GI3662@free.fr>
 <alpine.LNX.2.00.1507262133400.12764@T520.local>
Message-ID: <CA+h8R2pQPtABif=URE-g--bpLNnyDJCZMBCi5jUaFUXWC9DJNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulli,

On Sun, Jul 26, 2015 at 12:59 PM Hans Ulli Kroll <ulli.kroll@googlemail.com>
wrote:

[snip]

So, now the driver is *allways* build with debug info, see
> CONFIG_RTLWIFI_DEBUG
> but you *must* enable this while loading the driver i.e.
>
> insmod rtl8821au debug=5
>
> To be very verbose, default is debug=0 for no debug output.
>

That's a bit odd. When loading the driver as-is from your repository
without any arguments, I get a very verbose amount of logging to the kernel
logs. Are you sure this is the case? With the patch in the merged
repository most of the debugging is disabled through header define comments.


>
> For the code itself :
> I've done *a lot* functions renames and other things.
> I use the rtl8821ae driver as some kind of pattern and the rtl8192cu
> driver for the USB part.


Great!

~ Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/2fa19724/attachment.html>
