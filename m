From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Oct 2009 12:03:09 +0200
Subject: [Buildroot] [PATCH 16/23] qt: disable precompiled headers when
 ccache is enabled
In-Reply-To: <1254907246-5650-17-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-17-git-send-email-mroth@nessie.de>
Message-ID: <20091007120309.7cc5035f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  7 Oct 2009 11:20:39 +0200,
Michael Roth <mroth@nessie.de> a ?crit :

> ccache and precompiled headers don't work together, so disable
> precompiled headers when ccache is enabled.
> 
> The benefit of ccache compiling Qt a second or more time is much
> higher than the costs of disabled precompiled headers in the first
> run.
> 
> Signed-off-by: Michael Roth <mroth@nessie.de>

Never used CCACHE in Buildroot, so never tried this or faced the issue,
but anway:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
