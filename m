From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 17:28:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump to version
 1.7.3
In-Reply-To: <20190330174249.30431-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 30 Mar 2019 18:42:49 +0100")
References: <20190330174249.30431-1-bernd.kuhls@t-online.de>
Message-ID: <87lg0osc7m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changelog: https://wiki.znc.in/ChangeLog/1.7.3
 > Fixes CVE-2019-9917:
 > http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9917
 > - ZNC before 1.7.3-rc1 allows an existing remote user to cause a Denial
 >   of Service (crash) via invalid encoding.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
