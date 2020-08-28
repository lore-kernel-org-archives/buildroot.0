From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:11:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: fix CVE-2020-15900
In-Reply-To: <20200810091441.508401-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 Aug 2020 11:14:41 +0200")
References: <20200810091441.508401-1-fontaine.fabrice@gmail.com>
Message-ID: <87d03avjhc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > A memory corruption issue was found in Artifex Ghostscript 9.50 and
 > 9.52. Use of a non-standard PostScript operator can allow overriding of
 > file access controls. The 'rsearch' calculation for the 'post' size
 > resulted in a size that was too large, and could underflow to max
 > uint32_t. This was fixed in commit
 > 5d499272b95a6b890a1397e11d20937de000d31b.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
