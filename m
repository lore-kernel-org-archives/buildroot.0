From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 22:26:54 +0100
Subject: [Buildroot] [PATCH v2 2/6] polkit: new package
In-Reply-To: <1357591399-3566-3-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20130107222654.35096281@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marek Belisko,

On Mon,  7 Jan 2013 21:43:15 +0100, Marek Belisko wrote:

> +POLKIT_LICENCE = GPL

LICENSE, not LICENCE. And be more specific than GPL.

> +POLKIT_LICENCE_FILES = COPYING

LICENSE_FILES.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
