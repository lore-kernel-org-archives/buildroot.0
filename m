From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Feb 2013 05:54:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-02-12
In-Reply-To: <511D556D.3060503@lucaceresoli.net>
References: <20130213073425.9C3C052C6D2@lolut.humanoidz.org>
 <511D556D.3060503@lucaceresoli.net>
Message-ID: <20130215055400.6688c117@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Thu, 14 Feb 2013 22:21:49 +0100, Luca Ceresoli wrote:

> Should I send a patch to set -no-pch? I'm reluctant because it's not a real
> fix, and compile time could increase significantly, I guess.
> 
> Thomas, this probably affects Qt5 Beta 1 as well, according to this blog 
> post:
> http://gpupowered.org/node/14. Would you mind testing it on your Qt5 branch?

For Qt5, I do have -no-pch otherwise it doesn't build
(http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=7c1f7b9967d814e3f5c838e7090ac04b9d06af51).
Apparently, there are bugs in the precompiled headers implementation.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
