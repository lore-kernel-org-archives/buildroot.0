From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 23 Aug 2012 20:54:18 +0200
Subject: [Buildroot] dropbear permission denied
Message-ID: <CAAfyv37BVphvKch7Ww0mP2Aid2Wt5GQ+ZGZopwrxy2=BO5o4WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
