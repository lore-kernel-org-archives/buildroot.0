From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 21:52:53 +0200
Subject: [Buildroot] Autobuilder Buildroot toolchains updated
Message-ID: <20160523215253.1a65d591@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have once again rebuilt and updated the pre-built Buildroot
external toolchains used in the autobuilders. They are now built
against 2016.05-rc2 + commit 204590af0e6535920a9eeb5f276af1870d953343,
which bumps the 4.5 kernel headers series to 4.5.5.

The main motivation for this rebuild is that the 4.5.5 kernel headers
contain a fix in one header that will fix the connman build (and maybe
a few other packages).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
