From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:44:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot: security bump version
 to 2.3.11.3
In-Reply-To: <20200818165436.145310-2-bernd.kuhls@t-online.de>
References: <20200818165436.145310-1-bernd.kuhls@t-online.de>
 <20200818165436.145310-2-bernd.kuhls@t-online.de>
Message-ID: <20200818234442.6fcdb64b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Aug 2020 18:54:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://dovecot.org/pipermail/dovecot-news/2020-August/000440.html
> 
> Fixes the following CVEs:
> 
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
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dovecot/dovecot.hash | 2 +-
>  package/dovecot/dovecot.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
