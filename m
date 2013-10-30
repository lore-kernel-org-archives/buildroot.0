From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:16:44 +0100
Subject: [Buildroot] [PATCH 1/1] hplip: bump to version 3.13.10
In-Reply-To: <1383165435-14305-1-git-send-email-olivier.schonken@gmail.com>
References: <1383165435-14305-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20131030221644.28f0d77a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Wed, 30 Oct 2013 22:37:15 +0200, Olivier Schonken wrote:

>   # ui (qt3)
> -@@ -564,26 +564,26 @@ endif
> - 
> - install-dist_hplip_LogDATA:
> - if FULL_BUILD
> --	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
> --	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
> --	chmod 775 $(DESTDIR)$(hplip_Logdir)
> -+#	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
> -+#	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
> -+#	chmod 775 $(DESTDIR)$(hplip_Logdir)
> - endif	#FULL_BUILD
> - if HPLIP_BUILD
> --	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
> --	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
> --	chmod 775 $(DESTDIR)$(hplip_Logdir)
> -+#	test -z "$(DESTDIR)$(hplip_Logdir)" || mkdir -p $(DESTDIR)$(hplip_Logdir)
> -+#	chgrp "lp" -R $(DESTDIR)$(hplip_Logdir)
> -+#	chmod 775 $(DESTDIR)$(hplip_Logdir)
> - endif	#FULL_BUILD
> - 
> - install-dist_hplip_tmpDATA:
> - if FULL_BUILD
> --	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
> --	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
> --	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
> -+#	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
> -+#	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
> -+#	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
> - endif	#FULL_BUILD
> - if HPLIP_BUILD
> --	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
> --	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
> --	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
> -+#	test -z "$(DESTDIR)$(hplip_tmpdir)" || mkdir -p $(DESTDIR)$(hplip_tmpdir)
> -+#	chgrp "lp" -R $(DESTDIR)$(hplip_tmpdir)
> -+#	chmod 1775 $(DESTDIR)$(hplip_tmpdir)
> - endif	#FULL_BUILD
> - 
> - install-dist_cronDATA:$(dist_cron_DATA)

Thanks for this patch. Would you mind giving a few more details on the
reason for removing those lines? They are no longer present in the
upstream Makefile? Something else?

Generally speaking, when a version bump comes with other changes (like
changes to patches), it's good to describe them a little bit.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
