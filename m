From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:12:01 +0200
Subject: [Buildroot] [PATCH 22/69] libftdi: add explicit dependencies
 for host variant
In-Reply-To: <1467498098-23731-23-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-23-git-send-email-julien.floret@6wind.com>
Message-ID: <20160703091201.393df19c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 00:20:51 +0200, Julien Floret wrote:
> This patch also removes an incorrect dependency between host-libftdi and
> host-boost when BR2_PACKAGE_LIBTFDI_CPP is set.

Nice find!

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
