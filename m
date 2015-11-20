From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Fri, 20 Nov 2015 17:48:19 +0000
Subject: [Buildroot] Build 2015.11-rc2
Message-ID: <1448041697.3756.15.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

I pulled 2015.11-rc2, and while based Quark support is in there.

commit 968f5d5e59195e6e6a9a349ec9a118fb3a50b8b3
arch/x86: add support for Intel X1000

We are missing the support for Galileo Gen 1/2

commit 8715e18e9327cbde4e6b30cfab3982138b727e56
board: add support for Intel Galileo Gen 2

commit a763d10fd41e85841e074c6584e2b5cb4d54048b
board: readme.txt for Intel Galileo Gen 1/2

These commits missed the cut off for 2015.11.
Is there a way to backport from next?

Ray K
