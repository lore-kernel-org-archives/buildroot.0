From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 21:01:57 +0100
Subject: [Buildroot] [PATCH] package/libarchive: security bump to
 version 3.4.1
In-Reply-To: <1578340597-31153-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Mon, 6 Jan 2020 20:56:37 +0100")
References: <1578340597-31153-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <877e1zkrm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-19221: In Libarchive 3.4.0, archive_wstring_append_from_mbs in archive_string.c
 >  has an out-of-bounds read because of an incorrect mbrtowc or mbtowc call. For example,
 >  bsdtar crashes via a crafted archive.

 > And adds various security fixes.  For details, see :

 > https://github.com/libarchive/libarchive/releases/tag/v3.4.1

 > Also remove upstreamed patch.

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
 > ---
 > v1 -> v2 :
 > 	- update commit title "libarchive to package/libarchive"

Committed to 2019.11.x, thanks.

For 2019.02.x I will instead cherry-pick the upstream fix and apply to
our 3.3.x version.

-- 
Bye, Peter Korsgaard
