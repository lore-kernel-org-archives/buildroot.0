From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Aug 2018 16:26:43 +0200
Subject: [Buildroot] [PATCH] libarchive: add upstream security patches
In-Reply-To: <a154e047363347675abf5c0c172b4ca645bc7bf2.1533653722.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 7 Aug 2018 17:55:22 +0300")
References: <a154e047363347675abf5c0c172b4ca645bc7bf2.1533653722.git.baruch@tkos.co.il>
Message-ID: <8736vpgcik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add patches for the following security issues:
 > CVE-2017-14501 - An out-of-bounds read flaw exists in parse_file_info in
 > archive_read_support_format_iso9660.c when extracting a specially
 > crafted iso9660 iso file.

 > CVE-2017-14502 - Off-by-one error for UTF-16 names in RAR archives,
 > leading to an out-of-bounds read in archive_read_format_rar_read_header.

 > CVE-2017-14503 - Out-of-bounds read within lha_read_data_none() in
 > archive_read_support_format_lha.c when extracting a specially crafted
 > lha archive.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
