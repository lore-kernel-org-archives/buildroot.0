From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 15:00:47 +0200
Subject: [Buildroot] [PATCH buildroot-test 8/8] autobuild-run: add
 support for custom git wrapper
In-Reply-To: <20141017223023.GA7944@free.fr>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <1413486964-5183-8-git-send-email-patrickdepinguin@gmail.com>
 <20141017223023.GA7944@free.fr>
Message-ID: <20141018150047.1098f07a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 18 Oct 2014 00:30:23 +0200, Yann E. MORIN wrote:

> You know you can make this stick, right?
> 
>     git config --global --add core.gitproxy /path/to/git-proxy-command
> 
> And then you're done once and for all. ;-)

Yes, I was also wondering why a change to each and every git invocation
was needed: surely like wget there should be a way to configure git to
use a proxy.

With what Yann has given, Thomas, do you still need this patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
