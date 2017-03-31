From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:54:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: security bump to 4.2.8p10
In-Reply-To: <20170322210313.10299-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 22 Mar 2017 22:03:13 +0100")
References: <20170322210313.10299-1-bernd.kuhls@t-online.de>
Message-ID: <8760iqylz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changed NTP_SITE to https to circumvent "URL transformed to HTTPS due
 > to an HSTS policy" during download.

 > For details about the bugs fixed see:
 > http://support.ntp.org/bin/view/Main/SecurityNotice#Recent_Vulnerabilities
 > http://www.kb.cert.org/vuls/id/633847

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
