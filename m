From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 13:15:58 +0200
Subject: [Buildroot] [PATCH 06/36] package/usbredir: new package
In-Reply-To: <1344815664-28138-6-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-6-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120817131558.77a46760@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Aug 2012 01:53:54 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> +# Note: do not ofrget to update the license, above, if you keep the server.

forget

Otherwise, looks good.

Another note: have you looked at the uClibc compatibility of all these
new packages, regarding things like wchar, locale, largefile, ipv6 and
al. ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
