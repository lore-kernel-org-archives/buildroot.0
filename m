From: Amand Tihon <amand.tihon@alrj.org>
Date: Tue, 27 Jan 2009 22:14:42 +0100
Subject: [Buildroot] [PATCH] Add radvd to the list of packages
In-Reply-To: <200901271757.28001.amand.tihon@alrj.org>
References: <200901271757.28001.amand.tihon@alrj.org>
Message-ID: <200901272214.48303.amand.tihon@alrj.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 27 janvier 2009, Amand Tihon a ?crit?:
> Add radvd, the IPv6 router advertisement daemon.

Thanks to Peter Korsgaard help, I'm working on a much cleaner patch.

One small thing still bugs me: the executables are installed in $(TARGET_DIR) 
as (in my case) "avr32-linux-radvd" and "avr32-linux-radvdump" instead of 
plain "radvd" and "radvdump".

My current solution is to rename both files in $(RADVD_HOOK_POST_INSTALL). At 
least, it's working.

Does anyone know what could cause this, and how to correct it ?

Thanks in advance.

-- 
Amand Tihon
Rue du Ruchaux, 1 - 1490 Court-St-Etienne, Belgique
+32 479 207 743
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part.
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090127/2049ec22/attachment.pgp 
