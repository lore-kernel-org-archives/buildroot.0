From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 21:45:30 +0200
Subject: [Buildroot] [PATCH 04/20] package/skeleton: make
 SKELETON_LIB_SYMLINK a macro
In-Reply-To: <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170722214530.5aef8e0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:25:30 +0200, Yann E. MORIN wrote:
> Rather than duplicate that code in all skeleton packages, make this a
> macro, so that it is easier to use.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/skeleton/skeleton.mk | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
