From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:26:05 +0200
Subject: [Buildroot] [PATCH 0/3] Fix and improve the S02sysctl init
 script
In-Reply-To: <20200329234924.14505-1-unixmania@gmail.com>
References: <20200329234924.14505-1-unixmania@gmail.com>
Message-ID: <20200330072605.2dc561af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Mar 2020 20:49:21 -0300
unixmania at gmail.com wrote:

> Carlos Santos (3):
>   pakage/busybox: use same S02sysctl script as procps-ng
>   package/procps-ng: add busybox-related comments to S02sysctl
>   pakage/procps-ng: use logger in S02sysctl only if it is available

Thanks, series applied. I must admit I'm starting to be a bit worried
by the complexity of what should be a simple script to load sysctl
values, but OK.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
