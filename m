From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:52:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: security bump version
 to 2.3.11.3
In-Reply-To: <20200818165436.145310-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 18 Aug 2020 18:54:36 +0200")
References: <20200818165436.145310-1-bernd.kuhls@t-online.de>
 <20200818165436.145310-2-bernd.kuhls@t-online.de>
Message-ID: <87tuwmr9um.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://dovecot.org/pipermail/dovecot-news/2020-August/000440.html

 > Fixes the following CVEs:

 > * CVE-2020-12100: Parsing mails with a large number of MIME parts could
 >   have resulted in excessive CPU usage or a crash due to running out of
 >   stack memory.
 > * CVE-2020-12673: Dovecot's NTLM implementation does not correctly check
 >   message buffer size, which leads to reading past allocation which can
 >   lead to crash.
 > * CVE-2020-10967: lmtp/submission: Issuing the RCPT command with an
 >   address that has the empty quoted string as local-part causes the lmtp
 >   service to crash.
 > * CVE-2020-12674: Dovecot's RPA mechanism implementation accepts
 >   zero-length message, which leads to assert-crash later on.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
