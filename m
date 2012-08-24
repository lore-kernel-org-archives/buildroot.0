From: Dirk Lohse <d.lohse@meier-nt.de>
Date: Fri, 24 Aug 2012 08:56:32 +0200
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local>
References: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local>
Message-ID: <3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

ssh/dropbear doesn't work without password (right?). I've created a password for root and it works. If not - maybe there is another problem. When target-fs is mounted read-only you should get another failure.

Dirk


-----Urspr?ngliche Nachricht-----
Von: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Im Auftrag von Belisko Marek
Gesendet: Donnerstag, 23. August 2012 21:01
An: buildroot at uclibc.org
Betreff: [Buildroot] dropbear permission denied

Hi,

second time I'm using dropbear for embedded project and again same troubles ;)
(and cannot remember how to resolve it first time). I compile
buildroot with dropbear support.
Booting board keys was generated. Then want to copy some file from PC to board:
scp test.txt root@<IP>:/home/defaut and result is:
Permission denied, please try again.

What I'm doing wrong? Is there anything I'm missing? Must root user have passwd
to make dropbear working (try it but it doesn't work)?

Thanks for replies.

Cheers,

mbe


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
