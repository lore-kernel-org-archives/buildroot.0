From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:21:52 +0200
Subject: [Buildroot] [PATCH] package/cdrkit: fix musl build
In-Reply-To: <1439068205-12557-1-git-send-email-romain.naour@openwide.fr>
References: <1439068205-12557-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150809112152.7a6d1553@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  8 Aug 2015 23:10:05 +0200, Romain Naour wrote:
> Define __THROW if not already defined by the C library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d27/d2781e70b04a207e2e9397d888032294c7285034/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...ne-__THROW-to-avoid-build-issue-with-musl.patch | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
