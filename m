From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:57:09 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: Restrict Sourcery
 CodeBench toolchains for MIPS/n32
In-Reply-To: <1376383544-26722-1-git-send-email-markos.chandras@imgtec.com>
References: <1376383544-26722-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20130813115709.3431f9e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 13 Aug 2013 09:45:44 +0100, Markos Chandras wrote:
> n32 is not supported in Sourcery CodeBench toolchains.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  toolchain/toolchain-external/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
