From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 16:03:01 +0200
Subject: [Buildroot] [RFC PATCH] pkg-generic: detect incorrectly used
 package
In-Reply-To: <55E06603.2090100@imgtec.com>
References: <1440768358-31040-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55E06603.2090100@imgtec.com>
Message-ID: <20150828160301.4fb14e9a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 28 Aug 2015 14:45:39 +0100, Vicente Olivert Riera wrote:

> I tried to test your patch and I have found this:
> 
> ERROR: package TOOLCHAIN_EXTERNAL is being built but is not enabled in
> the configuration.

Right, my patch is wrong for the toolchain, bootloaders and linux
packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
