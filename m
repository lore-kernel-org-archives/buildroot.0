From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 9 Nov 2018 07:37:00 +0000
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <4e18d189-1a5b-3a73-5726-4a248af87713@mind.be>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <4e18d189-1a5b-3a73-5726-4a248af87713@mind.be>
Message-ID: <1541748990.3853.1.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I missed your mail, outlook is soooo awful to follow a mailing
list thread :(. I had to configure a mail client to see it.

> ?In a situation like this, you can't keep the original
> Acked/Tested/Reviewed-by
> tags, because the context has changed.
> 

Ok, I wasn't sure, thank you for the explanation. If there is still a
chance that the patch can be applied, I'll repost it without the tags.

> ?Also, there is (normally) no need to keep the conflicts information
> when you
> rebase a patch.

Ok, thank you again.

And sadly, on my side, I'll have to keep this patch (and the
corresponding one for u-boot), because even if I dislike the idea of
maintaining buildroot patches locally, having kernel and u-boot
versions differ between what is built and what is set in the
configuration is, a more serious issue.

I still have some hope that this patch can be considered for inclusion
or that a clean alternative solution is proposed, though :).

Regards,
Nicolas
