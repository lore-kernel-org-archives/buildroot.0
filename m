From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:41:48 +0100
Subject: [Buildroot] [PATCH 1/2] package/pseudo: new package
In-Reply-To: <05edc0b87e262b290da043479e16dd1b10c0ac70.1477729581.git.yann.morin.1998@free.fr>
References: <cover.1477729581.git.yann.morin.1998@free.fr>
 <05edc0b87e262b290da043479e16dd1b10c0ac70.1477729581.git.yann.morin.1998@free.fr>
Message-ID: <20161103214148.16d86fcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 10:26:41 +0200, Yann E. MORIN wrote:
> Pseudo is a program that can either be used directly or as an
> LD_PRELOAD, which allows these operations to succeed as if the
> user did have system administrator privileges even though they
> are an ordinary user.
> 
> Pseudo has a lot of similarities to fakeroot but is a new
> implementation that improves on the problems seen using fakeroot.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Andrey Yurovsky <yurovsky@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pseudo/pseudo.hash |  2 ++
>  package/pseudo/pseudo.mk   | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/pseudo/pseudo.hash
>  create mode 100644 package/pseudo/pseudo.mk

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
