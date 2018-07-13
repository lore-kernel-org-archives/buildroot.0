From: Anton Kuzmin <ak@aries-embedded.de>
Date: Fri, 13 Jul 2018 10:34:22 +0200
Subject: [Buildroot] RISC-V support
Message-ID: <0fb21945-492b-520b-e859-b827429312bd@aries-embedded.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Is anybody already working on adding of the RISC-V [1] support
to buildroot?  If yes, is there any place to discuss/share the progress?
If not, are there any reasons not to do it?

As a starting point, I have made minimal additions resulting in
a successful build of the buildroot toolchain and sdk.
At the moment 64-bit only, gcc-7.3.0, glibc-2.27-57 -- from upstream.


Best regards,

Anton Kuzmin


[1] https://riscv.org/
