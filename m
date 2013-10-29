From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 29 Oct 2013 21:24:45 +0000
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029204108.5d707d09@skate>
References: <20131029204108.5d707d09@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F15218@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> It would be really nice if the people working on those architectures in
> Buildroot could contribute a little bit more to fix the autobuilders
> failures, or at least get in touch with us to discuss how to solve them, or
> if they have no clue how to solve them.

Thanks for the list of results. Quite a few of the failures are related to some bugs in our version of GCC. We have fixed a number of these bugs and will release a new version of the toolchain soon (coming week?). With this release, I will also submit patches to the Buildroot project so that the latest TAR will be used.

Mischa
