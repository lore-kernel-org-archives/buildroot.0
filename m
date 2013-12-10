From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 10 Dec 2013 15:49:08 +0100
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
In-Reply-To: <87zjo84vjm.fsf@dell.be.48ers.dk>
References: <1675197757.16219192.1386680505536.JavaMail.root@openwide.fr>
 <874n6g6d0r.fsf@dell.be.48ers.dk>
 <CAAXf6LU_ia5PzN1MxVt9snUOcF5q983gR5VLy0ZDR8+qVPW9cA@mail.gmail.com>
 <87zjo84vjm.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWTJ9SdNKmZ-ys1v+siYzj4eST2mhcCP0uFCszkb_TJSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2013 at 3:42 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  > The first seems to emphasize that we require a Linux kernel to be
>  > built in buildroot, while the second one leaves it in the middle. For
>  > packages that actually build kernel modules, like ktap, we really need
>  > the kernel inside buildroot, right? Are there any packages that depend
>  > on BR2_LINUX_KERNEL that do _not_ require an in-buildroot kernel?
>
> I don't think so, as BR2_LINUX_KERNEL is the symbol to build a linux
> kernel internally.

Ok, sounds logical.
So what is the best comment text? Simply:
"foo needs a Linux kernel to be built"
?

If we can agree on something I will submit a patch to make this consistent.

Thanks,
thomas
