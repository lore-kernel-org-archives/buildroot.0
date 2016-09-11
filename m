From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:50:52 +0200
Subject: [Buildroot] [PATCH] binutils: fix makeinfo related issue
In-Reply-To: <1473364162-23847-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1473364162-23847-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160911225052.722684df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 21:49:22 +0200, Thomas Petazzoni wrote:
> The latest version of binutils, 2.27, added in commit
> b700157db40410907d6a07582eacbb5030fd919e, fails to build on systems
> that don't have makeinfo installed. This commit therefore applies the
> same fixup as the one used for binutils 2.26, which consists in
> touching all the .info files, so that they don't get rebuilt.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/binutils/binutils.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
