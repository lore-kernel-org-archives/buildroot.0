From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:25:13 +0200
Subject: [Buildroot] [PATCH 0/7 v5] support/download: make the git
 backend even more robust
In-Reply-To: <cover.1525164241.git.yann.morin.1998@free.fr>
References: <cover.1525164241.git.yann.morin.1998@free.fr>
Message-ID: <20180501212513.5b73d344@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 10:44:11 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       download/git: add warning not to use our git cache
>       download/git: run all git commands in the current directory
>       download/git: quickly exit when the cset does not exist
>       download/git: try to recover from utterly-broken repositories
>       download/git: ensure we checkout to a clean state
>       download/git: ensure we can checkout repos with submodule conversions
>       download/git: always do full-clone

Series applied, thanks! And thanks to Ricardo for all the testing and
review!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
