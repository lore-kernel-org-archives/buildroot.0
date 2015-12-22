From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 22:38:32 +0100
Subject: [Buildroot] [PATCH 1/2] wine: Make the sane-config patch
 obsolete by using configure flags
In-Reply-To: <5665EE7A.1080409@dawncrow.de>
References: <5665EE7A.1080409@dawncrow.de>
Message-ID: <20151222223832.164dc57d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?,

On Mon, 7 Dec 2015 21:39:22 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/wine/0003-sane-config-fix.patch | 21 ---------------------
>  package/wine/wine.mk                    |  3 ++-
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 package/wine/0003-sane-config-fix.patch

As I said earlier, I didn't like your approach. So I cooked an improved
patch for wine's configure.ac script to be able to explicitly pass the
location of the various *-config scripts. I have submitted this patch
upstream to the Wine project.

See
https://git.busybox.net/buildroot/commit/?id=79c7bae6cbd6c1dd062c32709f17ac0a6611bfbf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
