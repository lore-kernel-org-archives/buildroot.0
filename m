From: Gergely Imreh <imrehg@gmail.com>
Date: Tue, 26 May 2015 14:34:51 +0800
Subject: [Buildroot] showstopper 404 problem ...
In-Reply-To: <01c901d09724$065bca00$13135e00$@novadsp.com>
References: <01a201d0971b$fca690b0$f5f3b210$@novadsp.com>
 <20150525210558.39e88c66@free-electrons.com>
 <01c901d09724$065bca00$13135e00$@novadsp.com>
Message-ID: <CAJ3iQcpEX=3MBXwHki78F7NhELhQOb=WGapZFSXSzenYi4+R3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 May 2015 at 03:50,  <g4@novadsp.com> wrote:
> Hello Thomas and thanks
>
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.0.4"
>> >
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-
>> kernel/ti-
>> > linux-
>> > kernel.git"
>>
>> As explained by Yegor, use the mainline kernel, not TI's fork.
>>
>
> As in kernel.org? An example or the canonical repo would be really handy.

I'd guess Thomas means that for the mainline kernel you don't need any
custom repo, just use the default kernel version (it's already 4.0.4
in the current Buildroot). Much simpler and quicker that way.

If for whatever reason you want to use the git version of the tree,
you can find the clone URLs at the bottom of this page:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/
The https://git.kernel.org/cgit/ has all the various kernel repos that
you will never have to use directly. Just FYI.

Cheers,
   Greg

>
> TIA.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
