From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 15:33:36 +0200
Subject: [Buildroot] [PATCH v2 6/8] grub2: move usage notes to package
 readme.txt
In-Reply-To: <20170426213953.14904-7-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
 <20170426213953.14904-7-nunes.erico@gmail.com>
Message-ID: <20170716153336.2694eaad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 23:39:51 +0200, Erico Nunes wrote:
> As discussed in the mailing list, grub2 usage notes were growing too big
> for a Config.in documentation, and so it was agreed that a readme.txt in
> the package directory is a better place to put them.
> 
> This commit simply moves the documentation as-is to preserve the
> original contents as they were in Config.in which can be worked on in
> further commits.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This was not in v1.
> ---
>  boot/grub2/Config.in  | 100 +-------------------------------------------------
>  boot/grub2/readme.txt |  98 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 98 deletions(-)
>  create mode 100644 boot/grub2/readme.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
