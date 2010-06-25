From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Jun 2010 09:19:27 +0200
Subject: [Buildroot] [PATCH v4] package: Add support for pidgin/finch
 instant messenger (2.7.1)
In-Reply-To: <201006241726.25775.PeterHuewe@gmx.de>
References: <201005140300.25098.PeterHuewe@gmx.de>
	<201006241347.01454.PeterHuewe@gmx.de>
	<20100624160200.06b35fc9@surf>
	<201006241726.25775.PeterHuewe@gmx.de>
Message-ID: <20100625091927.4c67886b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2010 17:26:25 +0200
Peter Huewe <PeterHuewe@gmx.de> wrote:

> +	select BR2_PACKAGE_GNUTTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE

                           ^^^ should be BR2_PACKAGE_GETTEXT

Otherwise, looks good, I think the next version will get by Acked-by :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
