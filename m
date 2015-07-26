From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 23:56:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <20150726225918.5773dfda@free-electrons.com>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
 <20150726225918.5773dfda@free-electrons.com>
Message-ID: <CA+BsyQ7GC+QLmcS6GHMp9_DLgM6trx6L=hADqr_jA5hWa2_gGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The libfuse dependency seems to be unrelated to the musl problem, so it
> should be a separate patch.
>
> Also, I just did a build of exfat-utils which libfuse, and it built
> just fine, so I think you're wrong with the fact that it needs libfuse.
> Here is the defconfig I've used:
>

Thomas, there must have been something in my coffee today.

I've resubmitted with your (superior) patch suggestion and with the
dependency stuff removed. Hopefully it will do the job :) If that looks
better I'll send the updated patch to the exfat mailing list.

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/e996c695/attachment.html>
