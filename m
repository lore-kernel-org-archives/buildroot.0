From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 15:54:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.4
In-Reply-To: <20200104151457.2973445-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 4 Jan 2020 16:14:57 +0100")
References: <20200104151457.2973445-1-bernd.kuhls@t-online.de>
Message-ID: <87pnfrmkfl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Version 4.11.3 fixes
 > CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
 >                 management server (dnsserver).
 > CVE-2019-14870: DelegationNotAllowed not being enforced in protocol
 >                 transition on Samba AD DC.

 > Changelog:
 > https://www.samba.org/samba/history/samba-4.11.3.html
 > https://www.samba.org/samba/history/samba-4.11.4.html

 > Removed patches applied upstream, rebased patch 0002.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

For 2019.02.x I have instead bumped to 4.9.17, and for 2019.11.x to
4.10.11, both fixing the same issue.

-- 
Bye, Peter Korsgaard
