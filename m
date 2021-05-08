From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 11:38:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.94.2
In-Reply-To: <20210504202159.740520-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 4 May 2021 22:21:59 +0200")
References: <20210504202159.740520-1-bernd.kuhls@t-online.de>
Message-ID: <87y2cpy38p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release announcement:
 > https://lists.exim.org/lurker/message/20210421.123632.08bb711a.en.html

 > According to
 > http://www.exim.org/static/doc/security/CVE-2020-qualys/21nails.txt
 > this version bump fixes

 > Local vulnerabilities
 > - CVE-2020-28007: Link attack in Exim's log directory
 > - CVE-2020-28008: Assorted attacks in Exim's spool directory
 > - CVE-2020-28014: Arbitrary file creation and clobbering
 > - CVE-2021-27216: Arbitrary file deletion
 > - CVE-2020-28011: Heap buffer overflow in queue_run()
 > - CVE-2020-28010: Heap out-of-bounds write in main()
 > - CVE-2020-28013: Heap buffer overflow in parse_fix_phrase()
 > - CVE-2020-28016: Heap out-of-bounds write in parse_fix_phrase()
 > - CVE-2020-28015: New-line injection into spool header file (local)
 > - CVE-2020-28012: Missing close-on-exec flag for privileged pipe
 > - CVE-2020-28009: Integer overflow in get_stdinput()

 > Remote vulnerabilities
 > - CVE-2020-28017: Integer overflow in receive_add_recipient()
 > - CVE-2020-28020: Integer overflow in receive_msg()
 > - CVE-2020-28023: Out-of-bounds read in smtp_setup_msg()
 > - CVE-2020-28021: New-line injection into spool header file (remote)
 > - CVE-2020-28022: Heap out-of-bounds read and write in extract_option()
 > - CVE-2020-28026: Line truncation and injection in spool_read_header()
 > - CVE-2020-28019: Failure to reset function pointer after BDAT error
 > - CVE-2020-28024: Heap buffer underflow in smtp_ungetc()
 > - CVE-2020-28018: Use-after-free in tls-openssl.c
 > - CVE-2020-28025: Heap out-of-bounds read in pdkim_finish_bodyhash()

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
