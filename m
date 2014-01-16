From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 14:27:51 +0800
Subject: [Buildroot] [PATCH 0/3] Minor updates to linux-firmware package
In-Reply-To: <1389853671.877776.456824160566.0.gpush@pablo>
Message-ID: <1389853671.877776.456824160566.0.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

These are a few minor updates to the linux-firmware package, adding a
couple of options for ethernet adapters.

Patch 1/1 isn't strictly necessary, it was just bugging me a little :)

Cheers,


Jeremy

---
Jeremy Kerr (3):
      package/linux-firmware: Fix "firmwares" plural
      package/linux-firmware: Add bnx2x firmware
      package/linux-firmware: Add cxgb4 firmware
