From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Oct 2012 14:30:09 +0200
Subject: [Buildroot] [git commit] fs/skeleton: remove /etc/TZ
In-Reply-To: <20121024071711.0DF3599913@busybox.osuosl.org>
References: <20121024071711.0DF3599913@busybox.osuosl.org>
Message-ID: <20121024143009.23f6b698@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 24 Oct 2012 09:16:50 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=5a61fbd82394f9bc9317535b717a2e1dd51dea7d
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Defaulting to UTC (which is what uClibc will default to when /etc/TZ is
> missing) seems more sensible than US Mountain Time Zone in the default
> rootfs skeleton.

And with glibc/eglibc?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
