From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:36:17 +0200
Subject: [Buildroot] [PATCH v1] qt5base: remove libudev dependency from
 kms
In-Reply-To: <1471720194-22686-1-git-send-email-ps.report@gmx.net>
References: <1471720194-22686-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160820223617.0f3cbd35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 21:09:54 +0200, Peter Seiderer wrote:
> Use upstream patch [1]
> 
> Fixes [2]:
> 
>   KMS auto-detection... ()
>   Project ERROR: libudev development package not found
>   KMS disabled.
>    KMS support cannot be enabled due to functionality tests!
>    Turn on verbose messaging (-v) to ./configure to see the final report.
>    If you believe this message is in error you may use the continue
>    switch (-continue) to ./configure to continue.
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/patch/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
> [2] http://autobuild.buildroot.net/results/063/063859ad460552dd7c101115500b7845045a134f
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...07-Remove-libudev-dependency-from-kms.pro.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
