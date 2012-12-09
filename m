From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Dec 2012 19:42:23 +0100
Subject: [Buildroot] [PATCH 12/51] package/slirp: new package
In-Reply-To: <1355070924-8009-13-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-13-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121209194223.439bff79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  9 Dec 2012 17:34:45 +0100, Yann E. MORIN wrote:
> +# Note: The license file 'COPYRIGHT' is missing from the sources,
> +# although some files refer to it.
> +SLIRP_INSTALL_STAGING = YES
> +SLIRP_AUTORECONF      = YES

Justification for the _AUTORECONF=YES here?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
