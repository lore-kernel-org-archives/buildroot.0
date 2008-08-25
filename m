From: Steffen Schulz <pepe_ml@gmx.net>
Date: Mon, 25 Aug 2008 19:40:00 +0200
Subject: [Buildroot] New package util-linux-ng
In-Reply-To: <87iqtqpzcg.fsf@macbook.be.48ers.dk>
References: <20080810050649.GA26515@cbg.dyndns.org>
	<87iqtqpzcg.fsf@macbook.be.48ers.dk>
Message-ID: <20080825174000.GA7262@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On 080824 at 11:00, Peter Korsgaard wrote:
>  Steffen>   misses a file <linux/a.out.h> which is included in
>  Steffen>   <a.out.h>. I think this is a bug in some other packet?
> 
> What kernel headers version are you using? There used to be a bug
> where linux/a.out.h wasn't exported. I reported it and dwmw fixed it
> for 2.6.26:

That was indeed the problem. Attached is an update to the patch posted in
http://bugs.uclibc.org/view.php?id=2254


/steffen
-------------- next part --------------
A non-text attachment was scrubbed...
Name: util-linux-ng.patch
Type: text/x-diff
Size: 26502 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080825/b51b5e48/attachment.patch 
