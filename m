From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Tue, 21 May 2013 21:31:02 +0200 (CEST)
Subject: [Buildroot] Startup files numbering policy
In-Reply-To: <1882993282.1023650.1369164262752.JavaMail.root@advansee.com>
Message-ID: <430640706.1023684.1369164662782.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

So far, BuildRoot has always used arbitrary Sxx numbers for the startup files in
/etc/init.d/, e.g. S91smb in the samba package. Depending on each board needs,
these numbers might be more or less appropriate for the startup order. Do you
plan to add a mechanism to choose non-default custom numbering for those
scripts, or do you have a policy such as "It's up to each board to run
post-build scripts for such adjustments."?

Best regards,
Beno?t
