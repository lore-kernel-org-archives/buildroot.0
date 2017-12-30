From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 13:22:30 +0100
Subject: [Buildroot] [PATCH 1/3] package/brltty: add missing dependency
 on host-pkgconf
In-Reply-To: <20171230104804.16489-1-mlang@blind.guru>
References: <20171230104804.16489-1-mlang@blind.guru>
Message-ID: <20171230132230.5c23097b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 11:48:02 +0100, Mario Lang wrote:
> This fixes the following error:
>   ./configure: line 14978: .../host/bin/pkg-config: No such file or directory
> 
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  package/brltty/brltty.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
