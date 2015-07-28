From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:48:19 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: rename config option
In-Reply-To: <1438091302-3883-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438091302-3883-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150728224819.5c86ce07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 28 Jul 2015 10:48:21 -0300, Gustavo Zacarias wrote:
> Rename the binutils configuration option to match that one used by gcc
> where the patchlevel is explicitly left out.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy                | 27 +++++++++++++++++++++++++++
>  package/binutils/Config.in.host | 14 +++++++-------
>  package/gcc/Config.in.host      |  2 +-
>  3 files changed, 35 insertions(+), 8 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
