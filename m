From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 22 May 2015 15:00:33 +0200 (CEST)
Subject: [Buildroot] Buildroot 2015.05-rc3 released
In-Reply-To: <87pp5s29sb.fsf@dell.be.48ers.dk>
Message-ID: <1014950117.385973.1432299633915.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

----- Mail original -----
| De: "Peter Korsgaard" <peter@korsgaard.com>
| ?: buildroot at uclibc.org
| Envoy?: Vendredi 22 Mai 2015 12:20:36
| Objet: [Buildroot] Buildroot 2015.05-rc3 released
| 
| Hi,
| 
| Buildroot 2015.05-rc3 is released - Go download it at:
| 
| http://buildroot.net/downloads/buildroot-2015.05-rc3.tar.gz
| 
| or
| 
| http://buildroot.net/downloads/buildroot-2015.05-rc3.tar.bz2
| 
| Or get it from Git:
| 
| git://git.buildroot.net/buildroot
| 
| Another week, another release candidate.
| 

Please, don't forget this patch in order to be able to use the
aarch64 CS toolchain which is not tested in autobuilders.

http://patchwork.ozlabs.org/patch/467857/

Best regards,
Romain
| 
| --
| Bye, Peter Korsgaard
| _______________________________________________
| buildroot mailing list
| buildroot at busybox.net
| http://lists.busybox.net/mailman/listinfo/buildroot
