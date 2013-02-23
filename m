From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 10:20:54 +0100
Subject: [Buildroot] [PATCH] new package: libwnck
In-Reply-To: <201302212230.17978.yann.morin.1998@free.fr>
References: <1361469999-9963-1-git-send-email-stefan.froberg@petroprogram.com>
 <201302212230.17978.yann.morin.1998@free.fr>
Message-ID: <512889F6.5000005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/02/13 22:30, Yann E. MORIN wrote:
> But I'd prefer it it were a 'depends on BR2_PACKAGE_LIBGTK2' rather than
> a 'select'.
>
> And add a comment anyway to state why libwnck is not available.

  The other packages that depend on libgtk2 don't have a comment...

  Actually, I think all of them should be sorted under libgtk2, so 
they're nicely indented and fold open when libgtk2 is selected.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
