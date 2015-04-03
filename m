From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:22:03 +0200
Subject: [Buildroot] [PATCH] support/download: quick fix to avoid
 breaking on custom toolchains
In-Reply-To: <1428063598-27902-1-git-send-email-yann.morin.1998@free.fr>
References: <1428063598-27902-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150403142203.12f2b8e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  3 Apr 2015 14:19:58 +0200, Yann E. MORIN wrote:
> When the user selects a custom toolchain to be downloaded, there's no
> hash for that toolchain, so the download fails, now that hashes are
> mandatory.
> 
> Fix that by simply exiting as if there was no error, until we have a
> better fix...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  support/download/check-hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
