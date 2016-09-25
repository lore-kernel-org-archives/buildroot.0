From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:20:21 +0200
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: bump version
In-Reply-To: <20160923054717.23785-1-cyrilbur@gmail.com>
References: <20160923054717.23785-1-cyrilbur@gmail.com>
Message-ID: <20160925232021.708fe6d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 15:47:17 +1000, Cyril Bur wrote:
> Most importantly this version includes a change to kvm-unit-tests which
> means it will stop looking attempting to include host headers. This
> change should fix build breakage on i386.
> 
> "ERROR: unsafe header/library path used in cross-compilation: '-I'
> '/lib/modules/3.13.0-042stab111.12/build/include'"
> 
> The new version also includes more powerpc tests.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
