From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 08:44:19 +0200
Subject: [Buildroot] [PATCH 2/6] boot/optee-os: bump version to 3.5.0
In-Reply-To: <CAN5uoS8WRz32mCpXAdMGK29exopKxwwQbtK4Q-N4Z4XU=kzVEg@mail.gmail.com>
References: <20190513201602.2549-1-etienne.carriere@linaro.org>
 <20190513201602.2549-2-etienne.carriere@linaro.org>
 <20190513231215.6b080031@windsurf.home>
 <CAN5uoS8WRz32mCpXAdMGK29exopKxwwQbtK4Q-N4Z4XU=kzVEg@mail.gmail.com>
Message-ID: <CAN5uoS-krME6naZwuPoR-UWcNVDpd8BmuOPrJS=Wi1r4o6Q+nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By the way, I had a question.

This series is build from few upgrade/cleanup changes:
  [PATCH 1/6] "boot/optee-os: install trusted shared libraries"
followed by optee-os version bump:
  [PATCH 2/6]  "boot/optee-os: bump version to 3.5.0"
followed by each remaining OP-TEE package version bump:
  [PATCH 3/6]  "package/optee-client: bump version to 3.5.0"
  ...
  [PATCH 6/6]  "package/optee-benchmark: bump version to 3.5.0"

I think patches 2/6 up to 6/6 should be squashed into a single change
"OP-TEE: bump boot and packages version to 3.5.0".
Build optee-test from old 3.4.0 and optee-os from new 3.5.0 in the
same build may fail or generate failed tests.

Your thoughts on this squash proposal?

Regards,
etienne
