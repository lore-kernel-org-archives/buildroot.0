From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Apr 2013 16:03:50 +0200
Subject: [Buildroot] [PATCH 1/2] glibmm: new package
In-Reply-To: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
References: <1366791236-22718-1-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <20130424160350.4760cd0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear nmenegale,

On Wed, 24 Apr 2013 10:13:55 +0200, nmenegale wrote:

> +GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.bz2

I believe you could use the .tar.xz tarball instead, it's a bit smaller
to download.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
