From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Dec 2012 09:25:29 +0100
Subject: [Buildroot] [git commit] libtool: undeprecate for now
In-Reply-To: <20121203010304.2A651996F6@busybox.osuosl.org>
References: <20121203010304.2A651996F6@busybox.osuosl.org>
Message-ID: <20121203092529.05e8d34c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 2 Dec 2012 16:31:54 -0800, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f619d5ba20ef46c57259f35a21bb98b7c85c35a4
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Pulseaudio selects libtool, so get rid of the deprecated annotation so
> people don't get warnings about unmet dependencies when exiting menuconfig.

Pulseaudio needs libtool on the target? This sounds strange, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
