From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 16:49:26 +0200
Subject: [Buildroot] [PATCH] linux: provide symlink dtc->linux-dtc is
 there is no dtc yet
In-Reply-To: <f7954a6a-7dbf-847c-0512-48701527a91a@mind.be>
References: <1452252619-13802-1-git-send-email-patrickdepinguin@gmail.com>
 <20160531225015.0f2039e5@free-electrons.com>
 <f7954a6a-7dbf-847c-0512-48701527a91a@mind.be>
Message-ID: <20160601164926.4a8db42f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 16:41:51 +0200, Arnout Vandecappelle wrote:

>  I could be wrong, but don't we have situations where we really need linux-dtc
> and not host-dtc because linux-dtc is patched for e.g. DT overlays?

linux-dtc is not patched for DT overlays. You need to use patched DTC
versions, which are available on numerous random Github repositories,
but neither the DTC in the Linux kernel tree nor in its official
upstream Git repository are overlay capable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
