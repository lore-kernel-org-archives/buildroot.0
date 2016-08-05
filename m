From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 14:23:22 +0200
Subject: [Buildroot] [git commit] ncurses: factorize terminfo files
 installation
In-Reply-To: <20160805140721.59c6d8ae@armant.core.local.os.greenbone.net>
References: <20160803205324.76B9C81972@busybox.osuosl.org>
 <20160805140721.59c6d8ae@armant.core.local.os.greenbone.net>
Message-ID: <20160805142322.154dc0a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 14:07:21 +0200, Beno?t Allard wrote:

> It looks like this commit introduces a regression on our side, the
> "linux" terminfo is not installed anymore (see inlined comment).
> 
> Do you want me to provide a patch, or is that 'small enough' that you
> can take care of it ?

Thanks a lot for spotting the issue! I did double check this as I was
sure I could easily introduce a mistake, but apparently my double check
was not enough.

I've fixed the problem in commit
b0215a1a17f7c2ed11abfd02b47b6c7853260f40, you are credited in the
Reported-by tag.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
