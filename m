From: scd rjcom <scdrjcom@gmail.com>
Date: Mon, 25 Jan 2021 12:33:02 -0800
Subject: [Buildroot] Porting a vendor specific yocto layer to the
 buildroot
In-Reply-To: <877do07r4c.fsf@dell.be.48ers.dk>
References: <1611562430908-0.post@n4.nabble.com>
 <877do07r4c.fsf@dell.be.48ers.dk>
Message-ID: <CAGF7ZoZ8MUBbEB=6gXOCCSPNFJcF_Kva=XQducEx_u+O0EeATg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you!  I understand that the vendor specific layers have their own
packages and customizations.

I was looking for some generic guidelines to perform this. (Assuming that
all the packages are open source)

It would be great if buildroot documentation will provide some guidelines
to perform the porting of the Yocto layers to Buildroot.

Thanks!

On Mon, Jan 25, 2021 at 11:28 AM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "scdrj" == scdrj  <scdrjcom@gmail.com> writes:
>
>  > How do I port a vendor specific yocto layer to the buildroot?
>
> One step at a time?
>
> No seriously, it is hard to know without knowing what that layer
> does. You will need to have a look at everything it does and add
> packages and rootfs overlays / post-build scripts to do the same thing
> in Buildroot.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210125/9028d0dc/attachment.html>
