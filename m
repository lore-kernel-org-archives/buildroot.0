From: John Voltz <john.voltz@gmail.com>
Date: Thu, 6 Mar 2008 19:04:03 -0500
Subject: [Buildroot] Huge update
Message-ID: <46a136670803061604i406cdbe1p58f686c4b950bbe7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ninevoltz> added and removed uclibc patches

Why?
There were some redundant patches from Atmel, they were rolled into a larger
patch.

 ninevoltz> Added:
 ninevoltz>    trunk/buildroot/toolchain
/uClibc/Glibc_vs_uClibc_Differences.txt

Who is this for? Why here?
For convenience. Anyone developing or adding packages for use with uClibc
would probably like to know the differences. In hind sight it should
probably go into docs.

ninevoltz> +     http://avr32linux.org/twiki/pub/Main/XStroke

Is that the official upstream nowadays? Didn't it used to live on
handhelds.org?

It hasn't been touched on handhelds.org in over three years. A new site,
xstroke.org was created and then disappeared. I fear for it's continued
existence anywhere, so there it is.

 ninevoltz>    trunk/buildroot/scripts/
 ninevoltz>    trunk/buildroot/scripts/add_new_package.wizard
 ninevoltz>    trunk/buildroot/scripts/build-ext3-img
 ninevoltz>    trunk/buildroot/scripts/create_ipkgs

Adding something in docs/ about this would be nice.

Will do. The build-ext3-img and create_ipkgs scripts are a bit rough around
the edges. I hope to do more with them soon.

I knew I would probably ruffle some feathers with such a huge addition, but
hopefully we can fix it all up into something good.

John Voltz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080306/34b41ace/attachment.htm 
