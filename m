From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:55:15 +0100
Subject: [Buildroot] [PATCH 1/2] linux/linux.mk: added https:// pattern
 for kernel patches
In-Reply-To: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
References: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <20150114165515.04be4ac9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivo Slanina,

On Mon, 12 Jan 2015 17:37:25 +0100, Ivo Slanina wrote:
> Patches located at https:// scheme URL were threated as directories,
> causing build failures.
> 
> Fixed by adding https:// pattern.
> 
> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
> ---
>  linux/linux.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
