From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:29:00 +0200
Subject: [Buildroot] [PATCH] Revert "package/weston: libxkbcommon is
 optional"
In-Reply-To: <1402316139-7639-1-git-send-email-yann.morin.1998@free.fr>
References: <1402316139-7639-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140609142900.42a4cd34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  9 Jun 2014 14:15:39 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This reverts commit cf1c2eb19d3eeddca04013cfa7b2107530abf054.
> 
> xkbcommon is still needed for the clients. There's no point in disabling
> the clients, or weston is unusable (as packaged in Buildroot.)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/weston/Config.in | 11 +----------
>  package/weston/weston.mk |  9 +--------
>  2 files changed, 2 insertions(+), 18 deletions(-)

Applied after adding the relevant autobuilder reference. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
