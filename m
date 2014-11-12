From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 11:03:54 +0100
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
Message-ID: <20141112110354.1a6bcc98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sid Bharij,

On Tue, 11 Nov 2014 23:04:31 -0600, Sid Bharij wrote:

> I have been successful in getting the Linux kernel running on
> raspberry pi using build root. I wanted to create my own simple driver
> (a kernel module) and make it a part of the kernel. How can I do that
> using buildroot?

When I do my kernel development, I do it outside Buildroot, i.e I just
build the kernel separately. If needed, once the kernel development is
done, I use the final kernel version with my developments in Buildroot.

If you really want to do it with Buildroot, have a look at the
OVERRIDE_SRCDIR feature in the Buildroot manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
