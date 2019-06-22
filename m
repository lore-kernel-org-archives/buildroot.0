From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:54:38 +0200
Subject: [Buildroot] [PATCH 3/4] package/qt5/qt5base: work around gcc
 bug 90620
In-Reply-To: <20190618084535.75870-4-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
 <20190618084535.75870-4-giulio.benetti@micronovasrl.com>
Message-ID: <20190622205438.508025f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Jun 2019 10:45:34 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version <= 9.x the build hangs due to gcc bug

The build does not hang, but fails. I fixed the commit log, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
