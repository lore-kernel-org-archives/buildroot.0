From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:33:02 +0200
Subject: [Buildroot] [PATCH] libfslvpuwrap: fix tests of return value
 from IOGetVirtMem
In-Reply-To: <1406270593-17193-1-git-send-email-bisson.gary@gmail.com>
References: <1406270593-17193-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140726093302.0446eefe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Thu, 24 Jul 2014 23:43:13 -0700, Gary Bisson wrote:
> Same as similar patches for imx-vpu, the returned value from
> IOGetVirtMem was not properly checked.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Thanks, patch applied, after adding the reference to the upstream
discussion, as suggested by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
