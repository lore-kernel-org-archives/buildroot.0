From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 14:18:16 +0200
Subject: [Buildroot] [PATCH] libarchive: security bump to version 3.3.3
In-Reply-To: <601e6365ce2efee031d9c9b6f3fd4e8e54296d07.1539926405.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 19 Oct 2018 08:20:05 +0300")
References: <601e6365ce2efee031d9c9b6f3fd4e8e54296d07.1539926405.git.baruch@tkos.co.il>
Message-ID: <87tvlgdd6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-14501: An out-of-bounds read flaw exists in
 > parse_file_info in archive_read_support_format_iso9660.c in libarchive
 > 3.3.2 when extracting a specially crafted iso9660 iso file, related to
 > archive_read_format_iso9660_read_header.

 > Drop upstream patches.

 > Use upstream provided tarball hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
