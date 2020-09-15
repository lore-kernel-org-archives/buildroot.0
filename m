From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:17:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 9.53.0
In-Reply-To: <20200912165907.325097-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 12 Sep 2020 18:59:07 +0200")
References: <20200912165907.325097-1-fontaine.fabrice@gmail.com>
Message-ID: <871rj2ucpn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Use tar.gz as SHA512SUMS does not contain the hash for tar.xz
 > - Fix CVE-2020-15900: A memory corruption issue was found in Artifex
 >   Ghostscript 9.50 and 9.52. Use of a non-standard PostScript operator
 >   can allow overriding of file access controls. The 'rsearch'
 >   calculation for the 'post' size resulted in a size that was too large,
 >   and could underflow to max uint32_t.

 > https://www.ghostscript.com/doc/9.53.0/News.htm

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
