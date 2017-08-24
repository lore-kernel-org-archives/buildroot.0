From: Tauferner, Andrew T <andrew.t.tauferner@intel.com>
Date: Thu, 24 Aug 2017 19:05:55 +0000
Subject: [Buildroot] Skipping Kernel Build
Message-ID: <72B920929F34034DB9221646F9A8BED9340661A6@fmsmsx107.amr.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is it possible to point Buildroot at a bzImage and have that pulled in during the Buildroot build rather than always doing a kernel build?  I have a custom kernel that is already built that I want Buildroot to use without rebuilding the kernel.  It looks to me like Buildroot is always building the kernel.  I'm new to Buildroot so maybe I just don't see the option in the Buildroot Kernel menus.  I can't be the first person to ask for this but I haven't found an answer in all my searches.  Thanks.

Andrew Tauferner

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170824/1e9c163f/attachment.html>
