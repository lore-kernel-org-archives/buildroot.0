From: Will Newton <will.newton@gmail.com>
Date: Mon, 24 Aug 2009 17:33:19 +0100
Subject: [Buildroot] [PATCH] initial util-linux-ng package
In-Reply-To: <4A88F23F.7010904@impulze.org>
References: <4A88F23F.7010904@impulze.org>
Message-ID: <87a5b0800908240933x6482e5aw1d042c1597811567@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 17, 2009 at 7:01 AM, Daniel Mierswa<impulze@impulze.org> wrote:
>
> This is my first attempt to replace the obsolete util-linux package with
> util-linux-ng. I replaced the susv3 patch with an uptodate version and
> sent it upstream, the nls and umount2 patch were removed because I
> didn't face any issues. If there's platform specific stuff to be added
> we can still figure it out. I hope someone finds interest in this.
> Cheers.

This works for me, and I think the switch to util-linux-ng is long
overdue at this point. Thanks for doing this work.

Tested-by: Will Newton <will.newton@gmail.com>
