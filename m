From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:38:35 +0200
Subject: [Buildroot] [PATCH v2] batctl: fix musl builds
In-Reply-To: <20150331195113.GA3091@vostro>
References: <20150331195113.GA3091@vostro>
Message-ID: <20150331233835.73ba3568@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Tue, 31 Mar 2015 22:51:13 +0300, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/0701b880d0f82ef92d742346bfa97bb2af216ed3/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
> Changes: patch renamed from 0001-musl-netinet.patch to 0001-musl-fixes.patch
> 
>  package/batctl/0001-musl-fixes.patch | 192 +++++++++++++++++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 package/batctl/0001-musl-fixes.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
