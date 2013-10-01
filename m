From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 11:53:12 +0200
Subject: [Buildroot] ARC builds failing
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D685F0CE28@de02wembxa.internal.synopsys.com>
References: <E6BF041E97966E4DB955F0DF883AD2D685F0CE28@de02wembxa.internal.synopsys.com>
Message-ID: <20131001115312.7cae4d80@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Tue, 1 Oct 2013 07:58:35 +0000, Mischa Jonker wrote:

> Any comments/suggestions on below patch?

Well, I'm considering reverting my patch that turns the 3 stages build
into a 2 stages build, because it causes too much problems (not only
the ARC one, which you fixed, but also problems related to SSP), and I
don't know when I'll have the time to investigate those problems, which
are not so easy.

If you have some time, and interest in digging into such issues, let me
know, we can probably work together on them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
