From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 20 Apr 2012 10:05:15 +0200
Subject: [Buildroot] Samba breakage on arm
Message-ID: <4F9118BB.2010300@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Just for the heads up, as I am not sure we can do anything about it or I
don't know a proper way to fix this.

Building samba with any CodeSourcery/Codebench toolchains except the
2011.09 will trigger either a compiler segfault or an internal compiler
error.

This is for every case. Just enabling samba will break.

This means that in the latest release, you cannot build samba at least
with these toolchains.

I've not tested with ct-ng or internal toolchains however, so maybe it's
not that bad...

Thanks to (another) Maxime for noticing it :)

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
