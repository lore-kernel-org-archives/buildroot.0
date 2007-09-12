From: Roderick Taylor <myopiate@gmail.com>
Date: Wed, 12 Sep 2007 21:40:54 +1000
Subject: [Buildroot] [buildroot 0001474]: toolchain build, arch x86_64 ,
	variant core2 does not build
In-Reply-To: <6a159fc7ac57e67bc6483273eb8d8d2d@busybox.net>
References: <6a159fc7ac57e67bc6483273eb8d8d2d@busybox.net>
Message-ID: <e83232070709120440s27c1df9ai606b5b64626d8f66@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/2007, bugs at busybox.net <bugs@busybox.net> wrote:
> ----------------------------------------------------------------------
>  bernhardf - 09-07-07 11:55
> ----------------------------------------------------------------------
> See ML archives for the correct solution (default core2 if
> !GCC_VERSION_THIS && !GCC_VERSION_THAT; gcc-4.3 does support -mtune=core2
> just fine, so the proposed solution is not correct).
>

Is this patch close to what you had in mind?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: core2-generic.patch
Type: text/x-patch
Size: 1356 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070912/c35e79d6/attachment-0001.bin 
