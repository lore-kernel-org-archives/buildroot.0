From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 09:25:53 +0100
Subject: [Buildroot] [PATCH v3 2/6] Makefile: add $(HOST_DIR)/sbin to
 BR2_PATH
In-Reply-To: <1391114333-28001-3-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
 <1391114333-28001-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140131092553.25f1da16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 30 Jan 2014 21:38:49 +0100, Samuel Martin wrote:
> Extend BR2_PATH because few host-packages install programs in this
> location.

s/few/a few/

The meaning is completely different otherwise :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
