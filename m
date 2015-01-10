From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:29:45 +0100
Subject: [Buildroot] [PATCH v2] dillo: remove poisoned paths from
 configure
In-Reply-To: <20150110133426.GA21767@vostro>
References: <20150110133426.GA21767@vostro>
Message-ID: <20150110152945.36d146fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 10 Jan 2015 15:34:26 +0200, Alex Suykov wrote:
> Fixes http://autobuild.buildroot.net/results/10f/10f7ba386a13753c942139b8bc13ca74d8932f3a/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/dillo/0002-usr-local-include.patch | 27 +++++++++++++++++++++++++++
>  package/dillo/dillo.mk                     |  2 +-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 package/dillo/0002-usr-local-include.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
