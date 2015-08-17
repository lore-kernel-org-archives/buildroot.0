From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:45:34 +0200
Subject: [Buildroot] [PATCH] package/beecrypt: fix C++ support
In-Reply-To: <1439642802-9968-1-git-send-email-yann.morin.1998@free.fr>
References: <1439642802-9968-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150817224534.0afa067d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 15 Aug 2015 14:46:42 +0200, Yann E. MORIN wrote:
> C++ support unconditionally needs shared libraries; it uses
> dlopen/dlsym.
> 
> Also, fix the conditions under which the comment is shown.
> 
> Finally, explicitly require C++ support when configuring.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/beecrypt/Config.in   | 6 ++++--
>  package/beecrypt/beecrypt.mk | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
