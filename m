From: Gary Coulbourne <bear@bears.org>
Date: Wed, 19 Dec 2012 12:10:50 -0500
Subject: [Buildroot] [PATCH] Add support for dtb file in /boot directory
 on target
In-Reply-To: <50D0A947.5090107@mind.be>
References: <CAEnpE0x7wD8R4WSyt_Sk7fSFb8Z2vq2G+te1pdLe+=ihbi3rQA@mail.gmail.com>
 <50D0A947.5090107@mind.be>
Message-ID: <50D1F51A.3080901@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/18/2012 12:35 PM, Arnout Vandecappelle wrote:
>  Could you also resend this patch with git send-email? (See its man 
> page for how to configure it for gmail.)

Sure thing.

> Perhaps the whitespace is correct and gmail ate it, but just to be sure:
> indentation should be one tab.

I assume gmail ate it.  I use tabs by default in makefile-ish files.

>  Or are there use cases where you want the DTB in /boot, but not the 
> kernel image?

It seems the logical place for the dtb to live, with the kernel, bit it 
is possible someone would not want that.
Is there a consensus from the folks on the mailing list about what 
should be done with the dtb?

Peace,
Gary
