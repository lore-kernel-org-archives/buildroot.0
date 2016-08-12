From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Aug 2016 22:50:32 -0500
Subject: [Buildroot] RFC: package level compile time hardening
Message-ID: <CANQCQpZi9FpuNe4HRTyHghpBhaRRbWw2ojgJ1P2HVxeiJ+zgUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any suggestions on an approach to manage changes made to buildroot
packages to harden the build time cflags/ldflags of a specific
package, where by adding the additional flags, the build now requires
specific toolchain versions and may impact ability to have a package
compile across as many arch as it currently does.  We currently
maintain this sort of change as a rebased patch on top of master.
Thoughts for other options?

We're trying to do something similar to Ubuntu's hardening efforts and
so far have started with toolchain configuration and compile/link time
settings to enable key security features.
https://wiki.ubuntu.com/HardenedUbuntu

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
