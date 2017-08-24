From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:00:39 +0200
Subject: [Buildroot] Skipping Kernel Build
In-Reply-To: <72B920929F34034DB9221646F9A8BED9340661A6@fmsmsx107.amr.corp.intel.com>
References: <72B920929F34034DB9221646F9A8BED9340661A6@fmsmsx107.amr.corp.intel.com>
Message-ID: <20170824230039.33406ed9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Aug 2017 19:05:55 +0000, Tauferner, Andrew T wrote:

> Is it possible to point Buildroot at a bzImage and have that pulled
> in during the Buildroot build rather than always doing a kernel
> build?  I have a custom kernel that is already built that I want
> Buildroot to use without rebuilding the kernel.  It looks to me like
> Buildroot is always building the kernel.

Not correct: Buildroot only builds the Linux kernel if told todo so.

> I'm new to Buildroot so maybe I just don't see the option in the
> Buildroot Kernel menus. 

In the top-level menu: Kernel -> Linux kernel. Disable it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
