From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:32:16 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: needs threads
In-Reply-To: <1465324981-7012-1-git-send-email-ps.report@gmx.net>
References: <1465324981-7012-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160607213216.0e42f233@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 20:43:01 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   wiringPi.c:66:21: fatal error: pthread.h: No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/4e1/4e17697c1116b418d8d9c07a202f3c89186e463f
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/wiringpi/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
