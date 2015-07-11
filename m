From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:31:28 +0200
Subject: [Buildroot] [PATCH v2 0/3] util-linux: rework utilities menu
 for finer control
In-Reply-To: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
References: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20150712003128.68c1964c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat, 11 Jul 2015 18:09:58 -0400, Danomi Manchego wrote:
> This series changes the util-linux tool setup to support more scenarios.

Thanks. util-linux definitely needs some love. However, can you comment
on backward compatibility in terms of Config.in option? I.e, what
happens if a Buildroot user has an existing .config which uses
util-linux, and upgrades Buildroot to a version that contains your
patches. What will happen?

In any case, your patch 2/3 is removing
BR2_PACKAGE_UTIL_LINUX_BINARIES, so you should update Config.in.legacy
accordingly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
