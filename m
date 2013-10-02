From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 2 Oct 2013 13:46:48 +0000
Subject: [Buildroot] ARC builds failing
In-Reply-To: <20131001115312.7cae4d80@skate>
References: <E6BF041E97966E4DB955F0DF883AD2D685F0CE28@de02wembxa.internal.synopsys.com>
 <20131001115312.7cae4d80@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F0FA00@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > Any comments/suggestions on below patch?
> 
> Well, I'm considering reverting my patch that turns the 3 stages build into a
> 2 stages build, because it causes too much problems (not only the ARC one,
> which you fixed, but also problems related to SSP), and I don't know when
> I'll have the time to investigate those problems, which are not so easy.
> 
> If you have some time, and interest in digging into such issues, let me know,
> we can probably work together on them.

Unfortunately I don't have a lot of time in the coming weeks, but Anton (on cc) is actually more involved with ARC GNU toolchain development than I am, and he may be able/interested to spend some time digging into these build problems.

Thanks,

Mischa
