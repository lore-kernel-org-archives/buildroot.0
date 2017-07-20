From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 13:24:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: fix building _hashlib
 of host-python
In-Reply-To: <CAO6UsjAtLVapEx8L-o6+17kCGt+TzgM5m7+DrtEa8gVFfxYmug@mail.gmail.com>
References: <CAO6UsjCZQUKvmA-a0votPq5AFZ6ESkwpNbLvfEymU5uy_SdggA@mail.gmail.com>
 <20170720095636.72423497@windsurf>
 <CAO6UsjBm0q9_g8_dpuA=7kPcFuzhouvM_8GV1J=+76PDfVykSw@mail.gmail.com>
 <20170720102733.2d606f02@windsurf>
 <CAO6UsjAcBxW=sxOtPyGAY823uNk8QuZFSTjxGMqEMaVMbvg1uQ@mail.gmail.com>
 <20170720111913.0d9c9c77@windsurf>
 <CAO6UsjD3rv0Vg2GJM0JwELO_TnT2gt-DEt0hsTxRxvu5faTVNw@mail.gmail.com>
 <20170720130939.1b22a471@windsurf>
 <CAO6UsjAtLVapEx8L-o6+17kCGt+TzgM5m7+DrtEa8gVFfxYmug@mail.gmail.com>
Message-ID: <20170720132437.19f38ef4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 19:20:16 +0800, Diankun Zhang wrote:

> Thanks, Thomas, I would send out a new patch as you suggested.

But are you going to submit the patch that adds a package for pyang as
well ? Without the pyang addition, it doesn't make a lot of sense to
add support for building host-python with host-openssl.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
