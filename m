From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:53:09 +0200
Subject: [Buildroot] [PATCH 1/4] package/nodejs: Update to allow
 selecting node.js version
In-Reply-To: <1434298376-31893-1-git-send-email-martin@barkynet.com>
References: <1434298376-31893-1-git-send-email-martin@barkynet.com>
Message-ID: <20150614225309.07f354ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Sun, 14 Jun 2015 17:12:53 +0100, Martin Bark wrote:
> Signed-off-by: Martin Bark <martin@barkynet.com>

What is the motivation for supporting more than one version of NodeJS
at a time?

We generally try to avoid supporting multiple versions of a given
component, unless there are some really good reasons to do so (like
python2 vs. python3, or qt4 vs. qt5).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
