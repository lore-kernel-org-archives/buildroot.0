From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 4 Aug 2010 13:41:57 +0200
Subject: [Buildroot] downloading package from htts with certificate
Message-ID: <AANLkTi==fwdy_k4a0bu3zVtcCk-m1kCOHMuSM=cbAftp@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm working on splashy package integration to buildroot but I'm facing
a problem with package downloading.
Package is stored on place where SSL certificate is necessary. My output is:

>>> splashy 0.3.13 Downloading
--2010-08-04 13:28:28--
https://alioth.debian.org/frs/download.php/2691//splashy-0.3.13.tar.gz
Resolving alioth.debian.org... 217.196.43.134
Connecting to alioth.debian.org|217.196.43.134|:443... connected.
ERROR: cannot verify alioth.debian.org's certificate, issued by
`/O=Debian/CN=ca.debian.org/emailAddress=debian-admin at debian.org':
  Self-signed certificate encountered.
To connect to alioth.debian.org insecurely, use `--no-check-certificate'.
Unable to establish SSL connection.
--2010-08-04 13:28:28--
http://buildroot.net/downloads/sources//splashy-0.3.13.tar.gz
Resolving buildroot.net... 140.211.167.224
Connecting to buildroot.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://sources.buildroot.net//splashy-0.3.13.tar.gz [following]
--2010-08-04 13:28:29--  http://sources.buildroot.net//splashy-0.3.13.tar.gz
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-08-04 13:28:29 ERROR 404: Not Found.

How can I override this to properly download source of package?

Thanks in advance,

Marek



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
