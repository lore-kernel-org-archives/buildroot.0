From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 14:05:16 +0200
Subject: [Buildroot] [PATCH] kvm-unit-tests: fix build on x86-64 with
 specific gcc versions
In-Reply-To: <1494276103-22722-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1494276103-22722-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170515140516.06b7fa02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 22:41:43 +0200, Thomas Petazzoni wrote:

>  ...clock-be-explicit-about-mul-instruction-d.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/kvm-unit-tests/0001-x86-hyperv_clock-be-explicit-about-mul-instruction-d.patch

This patch has been accepted upstream:
https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/commit/?id=45276b5860522921c77fb3ccc1458ff5f223c3c6.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
