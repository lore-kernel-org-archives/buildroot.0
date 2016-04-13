From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:31:03 +0200
Subject: [Buildroot] [PATCH v2] mtd-utils: ubinize: fix return code on
 error
In-Reply-To: <1460502460-13713-1-git-send-email-luca@lucaceresoli.net>
References: <1460502460-13713-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160413223103.56feb9f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 01:07:40 +0200, Luca Ceresoli wrote:
> ubinize 1.5.2 (currently packaged in Buildroot) returns 0 in case of
> some errors. This can lead to unnoticed errors in the middle of a
> build.
> 
> Fix by adding a patch from upstream, which is not yet present in any
> released version.
> 
> Fetch from: http://git.infradead.org/mtd-utils.git/commit/5f50207231414bfdbac8f0f974a2824f24177d6e
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
