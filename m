From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Mar 2013 08:59:45 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
 'manual-update-lists'
In-Reply-To: <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
 <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
Message-ID: <20130312085945.7d595fb2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 12 Mar 2013 05:47:15 +0100, Samuel Martin wrote:

> +manual-update-lists:
> +	@$(call MESSAGE,"Updating the manual lists...")
> +	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) \
> +		$(TOPDIR)/support/scripts/gen-manual-lists.py

Sorry if this has been discussed before. Why don't we make this part of
the normal manual build process (make manual-pdf, make manual-html,
etc.), so that we don't have to version control the generated lists of
packages, and this updating of the lists is done automatically whenever
we generate the manual?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
