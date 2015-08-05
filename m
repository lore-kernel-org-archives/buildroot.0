From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:15:32 +0200
Subject: [Buildroot] [PATCH 7/9] zmqpp: update to use the gcc version
 dependency mechanism
In-Reply-To: <20150804201258.GZ3647@free.fr>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804201258.GZ3647@free.fr>
Message-ID: <20150805121532.76fd7ae3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 4 Aug 2015 22:12:58 +0200, Yann E. MORIN wrote:

> Don;t you want to take that opportunity to rewrite that with the more
> usual  !foo || !bar || !buz  syntax?

I've done that as a separate commit. Note that some of us still use the
depends on !(foo && bar && buz) form, but I agree that depends on !foo
|| !bar || !buz is a lot clearer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
