From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 22:04:12 +0200
Subject: [Buildroot] [PATCH] libarchive: add security patch for
	CVE-2016-1541
In-Reply-To: <1462989343-9459-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 May 2016 14:55:43 -0300")
References: <1462989343-9459-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877ff0jr9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-1541 - heap-based buffer overflow vulnerability in the
 > zip_read_mac_metadata function in libarchive, a multi-format archive and
 > compression library, which may lead to the execution of arbitrary code
 > if a user or automated system is tricked into processing a specially
 > crafted ZIP file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
