From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 3 Mar 2010 11:54:22 +0100
Subject: [Buildroot] Modules architecture
In-Reply-To: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
References: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
Message-ID: <4d28d4b51003030254r2541e9b6k5ef9678a69f35953@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use KERNEL_ARCH variable.
It's computed from BR2_ARCH in buildroot's makefiles.

--
Lionel

On Wed, Mar 3, 2010 at 11:51 AM, Sergey Naumov <sknaumov@gmail.com> wrote:
> Hello.
> There is a problem with kernel building when .config contains processor
> architecture that differs from BR2_ARCH. Then kernel will have architecture
> as in BR2_ARCH and modules as in?.config.
> Expectable behavior is to apply BR2_ARCH to both of them, or ignore it.
> As a result of the current implementation I got "invalid module format" for
> all modules compiled with the kernel.
> What should I do to avoid it "through buildroot configs", but not through
> changing architecture in kernel config?
> Sergey.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
