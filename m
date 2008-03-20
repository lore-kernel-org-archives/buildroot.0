From: John Voltz <john.voltz@gmail.com>
Date: Thu, 20 Mar 2008 13:28:23 -0400
Subject: [Buildroot] patch for ext3 script
In-Reply-To: <47E14396.1080109@liddicott.com>
References: <47E14396.1080109@liddicott.com>
Message-ID: <46a136670803201028r57017d55vd578b89b7add99a1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That script is largely a ripoff of this:
http://z.cs.utexas.edu/users/habals/blog/index.php/linux/35

John

On Wed, Mar 19, 2008 at 12:47 PM, Sam Liddicott <sam@liddicott.com> wrote:

> This patch uses sfdisk instead of fdisk to partition the disk image.
>
> However the script still doesn't work for me as grub seems to interpret
> the geometry different to the mount -o offset which copied the files
> there in the fist place.
>
> Sam
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080320/74d70001/attachment.htm 
