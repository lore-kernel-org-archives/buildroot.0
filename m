From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:55:47 +0100
Subject: [Buildroot] [PATCH] systemd: Explicitly configure
 split-usr=false and split-bin=true
In-Reply-To: <20181111150652.17459-7-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-7-alexander.sverdlin@gmail.com>
Message-ID: <20181111215547.488b4a96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Nov 2018 16:06:52 +0100, Alexander Sverdlin wrote:
> bison-based build of systemd runs couple of checks on the structure of the

I assume you wanted to say "meson-based build" and not "bison-based
build". I've fixed that and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
