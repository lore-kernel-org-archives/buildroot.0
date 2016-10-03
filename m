From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:21:24 +0200
Subject: [Buildroot] [PATCH 0/2] Symlinks in compilation path confuse
 check-host-rpath
In-Reply-To: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
References: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
Message-ID: <20161003232124.05d609cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Sep 2016 12:09:52 +0200, J?r?me Pouiller wrote:

> J?r?me Pouiller (2):
>   check-host-rpath: support symlinks in rpath
>   Canonicalize $(BASE_DIR)

Samuel, Yann, Arnout, could you help reviewing this patch series?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
