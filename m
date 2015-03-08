From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:33:26 +0100
Subject: [Buildroot] [PATCH] imlib2: imlib2-config: delete old reference
 to @my_libs@
In-Reply-To: <1425833670-22475-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425833670-22475-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150308183326.7d3ff5a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun,  8 Mar 2015 17:54:30 +0100, Fabio Porcedda wrote:
> The script "imlib2-config" returns "@my_libs@" that causes build failures
> on the programs that use it.
> This is a regression of version v1.4.6.
> 
> Add a upstream patch to fix it and reorder the patches to follow
> upstream branch order.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e1a7691a6528d635c308d7bf47a8be8aa0594190
> http://autobuild.buildroot.net/results/23fea2e4d668d69565d5f50493635fc834c54ce1
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
