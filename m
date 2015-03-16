From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:46:33 +0100
Subject: [Buildroot] [PATCH 1/1] linux: stop if one linux patches
 doesn't apply
In-Reply-To: <1426499837-14540-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1426499837-14540-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20150316194633.5c12d6bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear S?bastien Szymanski,

On Mon, 16 Mar 2015 10:57:17 +0100, S?bastien Szymanski wrote:
> If you have several linux patches directories, Buildroot does not stop
> if one patches of the first directories don't apply. This patch fixes
> this.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
