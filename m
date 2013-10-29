From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 00:42:03 +0100
Subject: [Buildroot] [PATCH] docs: document dhcpcd build problem on
 Blackfin
In-Reply-To: <1383080210-6155-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383080210-6155-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131030004203.220fd292@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Tue, 29 Oct 2013 21:56:50 +0100, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This patch is useless. dhcpcd uses fork(), so there is no chance for it
to work on Blackfin. I'm marking the patch as rejected in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
