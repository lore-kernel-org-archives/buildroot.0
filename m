From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 12:11:14 +0100
Subject: [Buildroot] [PATCH] bootlader/grub2: disable x86-64-efi choice
 on !BR2_ARCH_IS_64
In-Reply-To: <1421431115-5202-1-git-send-email-s.martin49@gmail.com>
References: <1421431115-5202-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150203121114.4a78bec2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 16 Jan 2015 18:58:35 +0100, Samuel Martin wrote:
> When x86-64-efi platform is selected, grub2 automatically adds -m64 to the
> CFLAGS. This makes the configure script failed when the toolchain does not
> have multilib support (like the Buildroot ones).
> 
> Reported-by: Noe Rubinstein <nrubinstein@aldebaran-robotics.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
