From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 10:18:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <20160824231003.29262-2-arnout@mind.be>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
Message-ID: <20160825101843.4d7740e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 01:10:03 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yy)
> +IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
> +endif

Why do you need both BR2_NEEDS_GETTEXT=y and BR2_PACKAGE_GETTEXT=y ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
