From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 29 Jan 2020 08:41:45 +0100
Subject: [Buildroot] Linux kernel: host-libyaml dependency
Message-ID: <CAGm1_ktWWnNymXDhkKowu+0u2DSwqNA-3dW6hHy_omW_PXXdOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had a build breakage during the 5.4.15 kernel compilation because of
the missing yaml library. The code in kernel is under scripts/dtc.

Has anyone encountered such a problem? Should we add host-libyaml
unconditionally?

Regards,
Yegor
