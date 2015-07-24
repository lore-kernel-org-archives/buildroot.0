From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 09:17:42 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version
 0.3.2
In-Reply-To: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150724091742.669aaf4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 23 Jul 2015 08:38:24 +0200, J?rg Krause wrote:
> Bump version, update hash and update patch.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This patch series is causing a number of build failures, such as:

  http://autobuild.buildroot.org/results/33f/33f1849c6d1441d8565835872281e33a980aba6f/build-end.log

/home/peko/autobuild/instance-2/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/usr/lib/libtirpc.so: undefined reference to `_authdes_seccreate'

Can you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
