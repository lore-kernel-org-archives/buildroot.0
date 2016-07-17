From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:36:28 +0200
Subject: [Buildroot] [PATCH v5 4/8] package/kodi: Add suboption to
 control unrar support
In-Reply-To: <1468260542-7194-4-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
 <1468260542-7194-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160717143628.3589aa0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 20:08:58 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_KODI_NONFREE
> +	bool "nonfree"

Changed to:

	bool "non-free components"

because "nonfree" doesn't mean much.

> +	help
> +	  Enable components with non-compliant licenses.

"non-compliant" doesn't mean anything. non-compliant with what? So I've
changed this to "non-free licenses".

Applied with these changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
