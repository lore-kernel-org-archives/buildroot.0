From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 20:43:49 +0100
Subject: [Buildroot] [git commit] package: add classpath
In-Reply-To: <20121204190928.0DF9899716@busybox.osuosl.org>
References: <20121204190928.0DF9899716@busybox.osuosl.org>
Message-ID: <20121204204349.15ee9b81@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 4 Dec 2012 10:21:05 -0800, Peter Korsgaard wrote:
> commit:
> http://git.buildroot.net/buildroot/commit/?id=5062f530081913bd0487f0f879be180f30836ab8
> branch:
> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Requires java, javac and jar on the build machine, similar to how we
> require gcc/g++.

So, it needs additional checks in support/dependencies/dependencies.sh
I guess.

> classpath: fixup

Doh ? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
