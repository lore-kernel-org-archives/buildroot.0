From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:22:45 +0100
Subject: [Buildroot] [PATCH v1] postgresql: disable spinlock support for
 arcle/arcbe
In-Reply-To: <1426796723-8325-1-git-send-email-ps.report@gmx.net>
References: <1426796723-8325-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150320142245.1ab761da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 19 Mar 2015 21:25:23 +0100, Peter Seiderer wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/9b2/9b20513253fa68a3eb5588464a206092bb45e82d
>   http://autobuild.buildroot.net/results/8ea/8ea59872bd68d302a11681426a47c70d9aa1475f
>   http://autobuild.buildroot.net/results/4a1/4a1cf5721af631e15e076a5bcdd8676839c2a98d
>   http://autobuild.buildroot.net/results/050/050a799f2e9e864e02cf75b2a5697ece215ab0a2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/postgresql/postgresql.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
