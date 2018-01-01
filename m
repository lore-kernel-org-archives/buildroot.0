From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:04:28 +0100
Subject: [Buildroot] [PATCH] package/brltty: depends on BR2_USE_MMU due
 to calls to fork()
In-Reply-To: <20180101151218.20372-1-mlang@blind.guru>
References: <20180101151218.20372-1-mlang@blind.guru>
Message-ID: <20180101230428.69f0598a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Jan 2018 16:12:18 +0100, Mario Lang wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/489dd7a19911b45ae7b0f1eade63def793e03ade
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  package/brltty/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
