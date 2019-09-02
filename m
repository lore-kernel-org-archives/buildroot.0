From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 13:53:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbsd: security bump to
 version 0.10.0
In-Reply-To: <20190812163744.10101-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 12 Aug 2019 18:37:44 +0200")
References: <20190812163744.10101-1-fontaine.fabrice@gmail.com>
Message-ID: <87o902ykww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove patch (already in version)
 > - Update site to get the latest version
 > - Update hash of license file (update in year, new file and author)
 > - Remove !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) dependency,
 >   __register_at_fork availability is correclty checked since
 >   https://gitlab.freedesktop.org/libbsd/libbsd/commit/b0ebb0d4c26b281facbab7a774510b541637b13b
 > - Includes Several security related fixes for nlist() reported by Daniel
 >   Hodson and one by Coverity Scan, see
 >   https://lists.freedesktop.org/archives/libbsd/2019-August/000229.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
