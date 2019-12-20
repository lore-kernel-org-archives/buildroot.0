From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 22:48:38 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libfreeimage: bump version
 to 3.18.0
In-Reply-To: <20190831140614.16535-1-bernd.kuhls@t-online.de>
References: <20190831140614.16535-1-bernd.kuhls@t-online.de>
Message-ID: <71ae150e-c36d-6249-58af-5e99627bc1ba@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On 8/31/19 4:06 PM, Bernd Kuhls wrote:
> Release notes:
> http://freeimage.sourceforge.net/news.html
> 
> Removed patches
> 0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch
> 0004-fix-gcc-6.patch
> 0005-Manage-powf64-with-glibc.patch
> because upstream added updated version of various dependencies.
> 
> Added upstream patch to fix big endian build.
> Added md5 & sha1 hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

After applying the patch(not easy as 'git am' because package's source 
code is a mix of DOS and UNIX newlines, check here:
http://lists.busybox.net/pipermail/buildroot/2019-December/269516.html
) it builds correctly, so:

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for helping me applying this patch.
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
