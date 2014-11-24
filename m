From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:03:43 +0100
Subject: [Buildroot] [PATCH] sstrip: fix source svn repoisoty url
In-Reply-To: <1416834282-30246-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416834282-30246-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20141124220343.3252a4ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 24 Nov 2014 14:04:42 +0100, Fabio Porcedda wrote:
> Because the svn repository url was changed the command
> "make sstrip-source" give this error:
> 
> svn: E000101: Unable to connect to a repository at URL 'svn://dev.openwrt.org/openwrt/trunk/tools/sstrip'
> svn: E000101: Can't connect to host 'dev.openwrt.org': Network is unreachable
> 
> To fix this error use the correct url "svn://svn.openwrt.org/openwrt".
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks, applied to master after fixing the commit title.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
