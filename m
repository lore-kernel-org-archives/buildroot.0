From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:52:45 +0200
Subject: [Buildroot] [PATCH] libsigsegv: unavailable for powerpc with
 uclibc
In-Reply-To: <1436191311-23939-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436191311-23939-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150718235245.733ef99b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  6 Jul 2015 11:01:51 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/c5f/c5fef9a89f99e13de9cabe52c2ac1602d85974fe/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libsigsegv/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
