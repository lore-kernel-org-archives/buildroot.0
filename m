From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:20:06 +0200
Subject: [Buildroot] [PATCH v2] package/mono: fixing missing locale
In-Reply-To: <1437991584-27267-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1437991584-27267-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150727232006.59db1bd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 27 Jul 2015 12:06:24 +0200, Angelo Compagnucci wrote:
> This patch fixes compilation error in case of a missing locale in toolchain.
> 
> Fixes: http://autobuild.buildroot.net/results/a0fc33a4ed90844f9529acc76a6ba183fe253771/
>        http://autobuild.buildroot.net/results/3ff839e894f0b8f9c2e3af9629d45e8efc09aecd/
>        http://autobuild.buildroot.net/results/5e11117048d965bc1fc44c738bb51f11164304af/
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes:

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
