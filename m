From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 11 Nov 2015 11:35:37 +0000
Subject: [Buildroot] Kernel patches in Buildroot
Message-ID: <56432809.3000902@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
We are designing the procedure to release our software stack based on buildroot.
Could you please tell what is the advised method for including a kernel patch
set in buildroot? I typically use BR2_LINUX_KERNEL_PATCH where I indicate each
patch file. Is there a easier way like using BR2_GLOBAL_PATCH_DIR for example?

Thanks for your help!

Joao
