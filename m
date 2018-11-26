From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 26 Nov 2018 15:49:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.22.4
In-Reply-To: <87y39gzs8i.fsf@dell.be.48ers.dk>
References: <20181125223818.40680-1-aperez@igalia.com>
 <87y39gzs8i.fsf@dell.be.48ers.dk>
Message-ID: <20181126154910.GB18222@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Nov 2018 23:50:53 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > This is a maintenance release of the current stable WebKitGTK+ version,
>  > which contains security fixes for  CVE-2018-4345, CVE-2018-4372,
>  > CVE-2018-4373, CVE-2018-4375, CVE-2018-4376, CVE-2018-4378,
>  > CVE-2018-4382, CVE-2018-4386, CVE-2018-4392, and CVE-2018-4416.
>  > Additionally, it fixes a few build failures, and a crash when using
>  > certain version of Cairo.
> 
>  > Release notes can be found in the announcement:
> 
>  >   https://webkitgtk.org/2018/11/21/webkitgtk2.22.4-released.html
> 
>  > More details on the issues covered by security fixes can be found
>  > in the corresponding security advisory:
> 
>  >   https://webkitgtk.org/security/WSA-2018-0008.html
> 
>  > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Great, this was still on my todo list - Committed, thanks.

Thanks! My intention was precisely getting it merged before the next Buildroot
release... which reminds me that a while ago I also sent an update to libepoxy
that has not yet been merged:

   https://patchwork.ozlabs.org/patch/981531/

It would be nice to sneak that in as well ;-)

Cheers,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181126/52d1f5a7/attachment.asc>
