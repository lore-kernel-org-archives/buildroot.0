From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 16:00:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/openssh: security bump to
 version 8.4p1
In-Reply-To: <20210301115903.10828-1-christian@paral.in> (Christian Stewart's
 message of "Mon, 1 Mar 2021 03:59:03 -0800")
References: <20210301115903.10828-1-christian@paral.in>
Message-ID: <87pn033xq9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > From: Baruch Siach <baruch@tkos.co.il>
 > Fixes CVE-2020-15778: scp in OpenSSH through 8.3p1 allows command injection in
 > the scp.c toremote function, as demonstrated by backtick characters in the
 > destination argument. NOTE: the vendor reportedly has stated that they
 > intentionally omit validation of "anomalous argument transfers" because that
 > could "stand a great chance of breaking existing workflows."

 > https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15778

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
