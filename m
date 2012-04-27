From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Apr 2012 09:19:56 +0200
Subject: [Buildroot] [git commit] audiofile: new package
In-Reply-To: <20120425101023.D67C396BAF@busybox.osuosl.org>
References: <20120425101023.D67C396BAF@busybox.osuosl.org>
Message-ID: <20120427091956.51519c23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Apr 2012 12:07:36 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> commit: http://git.buildroot.net/buildroot/commit/?id=a1c9bdd64393078f38f054a6aa6f7c7a84dbc483
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---

Looks like this new package is causing build issues:
http://autobuild.buildroot.org/results/0898cc3cfe4d17c894b9c94cd0a0a7a6c24bebc1/build-end.log.
I haven't investigated whether it's a package problem or a more general
toolchain problem.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
