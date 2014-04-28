From: William Welch <bvwelch@gmail.com>
Date: Mon, 28 Apr 2014 14:08:17 -0500
Subject: [Buildroot] [PATCH 3/6] upstream glibc 2.18/2.19 works fine
	with microblaze
In-Reply-To: <53553336.2020401@zacarias.com.ar>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-4-git-send-email-wbx@openadk.org>
 <53553336.2020401@zacarias.com.ar>
Message-ID: <CAPALihO_K2VsaYO9erhFrKZpY9755ACOjsm56O6VvxO9MA6-0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

When you say BR works fine for microblaze 'on QEMU', could you be more
specific?  little endian?  mmu? which 'defconfig' did you use with
buildroot?  Which version of QEMU, what command line?

I'd like to recreate your working setup and maybe that will give me a clue
to my troubles here...

I am trying to use the 'buildroot native toolchain' with a Spartan 6 little
endian microblaze MMU design, but I don't get very far with the native
toolchain. However, using the older 'external' toolchain boots linux fine.


thanks,

William



On Mon, Apr 21, 2014 at 10:03 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar>wrote:

> On 04/13/2014 06:47 AM, Waldemar Brodkorb wrote:
>
> > There is no need for Xilinx Git.
> >
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>
> Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> (on Qemu)
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140428/56da4166/attachment.html>
