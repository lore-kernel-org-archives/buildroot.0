From: Anton Kuzmin <ak@aries-embedded.de>
Date: Sat, 14 Jul 2018 09:27:44 +0200
Subject: [Buildroot] RISC-V support
In-Reply-To: <79a73931-16b0-7d5d-d514-be1baa16557b@smile.fr>
References: <0fb21945-492b-520b-e859-b827429312bd@aries-embedded.de>
 <7050aae3-7b98-4b09-41e0-27b60d42baa6@mind.be>
 <79a73931-16b0-7d5d-d514-be1baa16557b@smile.fr>
Message-ID: <ad88b0af-a397-107f-82bf-00415c74e045@aries-embedded.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13.07.2018 16:51, Romain Naour wrote:
>> uclibc: support riscv
> 
> musl (if supported)

Not yet, AFAIK

> After this work, we will need some help to fix all issues discovered by this new
> architecture/toolchain.

Yes, that's understood and expected.  Also I'm primary a hardware/FPGA
developer now and have very limited s/w expertise and bandwidth.

> It would be great to have someone able to test on a real hardware, at least we
> can test on Qemu (best effort).

Currently I have an access to the Arrow Everest evaluation board [1].
The plan is to configure it with [some] RISC-V CPU core/system-on-chip.

[1] https://www.arrow.com/en/campaigns/everest
