From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 17:51:05 +0100
Subject: [Buildroot] host-python build issue
In-Reply-To: <CALo-6+jKLNFqOG08oQbWZOd2RSjoeF8aFkS-zBY5Y77JNtd5Qg@mail.gmail.com>
References: <54AD3069.8090309@gmail.com>
 <20150107174313.3d9ea5ff@free-electrons.com>
 <CALo-6+jKLNFqOG08oQbWZOd2RSjoeF8aFkS-zBY5Y77JNtd5Qg@mail.gmail.com>
Message-ID: <20150107175105.74634f8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Wed, 7 Jan 2015 08:45:53 -0800, Charles Krinke wrote:

> If I might also suggest describing or setting up an option for a minimal
> python embedded target. Last week I tried to complile python for an
> embedded target and got hung up in the audio, dbm and other missing
> dependencies.

This seems weird. The setup for Python on target is normally pretty
minimal already, and the build is being tested every day by the
autobuilders.

Can you describe more precisely which configurations lead to build
issues with audio, dbm and others?

Please report bugs when you see issues. If we don't have bug reports,
we can't fix/improve things.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
