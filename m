From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 11 Sep 2012 10:12:40 -0400
Subject: [Buildroot] Patches to fix linux-pam failures in autobuilder
Message-ID: <CADiAo4J=p10k22LRMG1zU6XAyLRmJ5i6A1URWFqxh+YLcaOBQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Maybe this went unnoticed, but few days ago I posted patches which fix
the linux-pam build failures in autobuilder, and also to finalize
integration of PAM into Buildroot (PAM support in Busybox).

Hopefully these patches can be reviewed and committed. The fix is
trivial: to enable dbm functions in berkeleyDB as PAM depends on them
(the pam_userdb module).

Discussion: http://lists.busybox.net/pipermail/buildroot/2012-September/058390.html

Patches:

http://lists.busybox.net/pipermail/buildroot/2012-September/058386.html
http://lists.busybox.net/pipermail/buildroot/2012-September/058387.html
http://lists.busybox.net/pipermail/buildroot/2012-September/058388.html
http://lists.busybox.net/pipermail/buildroot/2012-September/058389.html

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
