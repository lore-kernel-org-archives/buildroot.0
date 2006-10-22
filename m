From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Sat, 21 Oct 2006 19:19:06 -0600
Subject: [Buildroot] Using udev, non-static /dev, and ramfs (or tmpfs)
In-Reply-To: <20061021183403.GA21456@reid1.localdomain>
References: <20061021183403.GA21456@reid1.localdomain>
Message-ID: <1161479946.4306.3.camel@iridium.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2006-10-21 at 11:34 -0700, don wrote:

> I see that /etc/init.d/S10udev tries to use "/sbin/udevstart", but
> I don't have that.
> 
> Would I be better off to keep things static?

I've been using udev for a bit (I think I added the original patch for
it). Since then a few things have changed. I've cleaned it up a bit
lately and have some patches for udev to fix exactly what you just
described. I'm not completely done yet, however here is a patch that
should fix most of that. Its created in the udev directory itself so as
not to pick up all the other changes in limbo.


-- 
Nathanael D. Noblet <nathanael@gnat.ca>
Gnat Solutions, Inc
-------------- next part --------------
A non-text attachment was scrubbed...
Name: udev.patch
Type: text/x-patch
Size: 3260 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061021/5b5e602f/attachment.bin 
