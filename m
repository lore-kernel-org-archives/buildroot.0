From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:28:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/mxml: fix download URL
In-Reply-To: <20170528213738.14379-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 28 May 2017 23:37:38 +0200")
References: <20170528213738.14379-1-bernd.kuhls@t-online.de>
Message-ID: <87d1ankcil.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The project moved to github, the current download URL is broken:
 > $ wget -q  http://www.msweet.org/files/project3/mxml-2.10.tar.gz
 > $ file mxml-2.10.tar.gz
 > mxml-2.10.tar.gz: HTML document, UTF-8 Unicode text, with very long lines

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
