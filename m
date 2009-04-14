From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 14 Apr 2009 11:32:34 +1000
Subject: [Buildroot] svn commit: [26007] trunk/buildroot/package/openssl
In-Reply-To: <20090407070120.F1F0D768C5@busybox.osuosl.org>
References: <20090407070120.F1F0D768C5@busybox.osuosl.org>
Message-ID: <20090414013234.GA29812@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 07, 2009 at 07:01:20AM +0000, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2009-04-07 07:01:20 +0000 (Tue, 07 Apr 2009)
> New Revision: 26007
> 
> Log:
> openssl: bump version
> 
> Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>, closes #217
> 
> Fixes multiple security flaws - See
> http://www.openssl.org/news/secadv_20090325.txt for details.
> 
> Added:
>    trunk/buildroot/package/openssl/openssl-0.9.8k-do-not-build-docs.patch
>    trunk/buildroot/package/openssl/openssl-0.9.8k-dont-force-large-file.patch
>    trunk/buildroot/package/openssl/openssl-0.9.8k-nofips.patch
>    trunk/buildroot/package/openssl/openssl-0.9.8k-uclibc-susv3-legacy.patch
> 
> Removed:
>    trunk/buildroot/package/openssl/openssl-0.9.8j-do-not-build-docs.patch
>    trunk/buildroot/package/openssl/openssl-0.9.8j-dont-force-large-file.patch
>    trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch
>    trunk/buildroot/package/openssl/openssl-0.9.8j-uclibc-susv3-legacy.patch
> 
> Modified:
>    trunk/buildroot/package/openssl/openssl.mk

How about removing the version number from the patch filenames? They're just
making the upgrades messy and there doesn't seem to have any benefit.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
