From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:47:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 0.102.2
In-Reply-To: <20200206184314.215974-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 6 Feb 2020 19:43:14 +0100")
References: <20200206184314.215974-1-bernd.kuhls@t-online.de>
Message-ID: <87zhcnnaqn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.clamav.net/pipermail/clamav-announce/2020/000045.html

 > Fixes CVE-2020-3123.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.11.x, thanks.

According to the CVE info the issue was only introduced in 0.102.0, so I
have not backported it to 2019.02.x:

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-3123

-- 
Bye, Peter Korsgaard
