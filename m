From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 19:10:53 +0100
Subject: [Buildroot] [PATCH 0 of 3] Fix oprofile build on powerpc
Message-ID: <patchbomb.1363111853@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Since the upstep of oprofile to 0.9.8, the powerpc build was broken.
This series fixes this problem.

As the last patch indicates, this is compile tested on x86 and powerpc,
but not runtime-tested.

Best regards,
Thomas
