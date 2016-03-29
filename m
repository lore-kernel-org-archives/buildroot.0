From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 15:03:01 +0200
Subject: [Buildroot] [PATCH v1] qwt: needs qt5 widgets/printsupport
In-Reply-To: <1459253935-21951-1-git-send-email-ps.report@gmx.net>
References: <1459253935-21951-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160329150301.6761b043@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 14:18:55 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   Project ERROR: Unknown module(s) in QT: printsupport
> 
> [1] http://autobuild.buildroot.net/results/b9a/b9adbc61922c89ad7a0e5dd13cd2ce3bde864ede
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qwt/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
