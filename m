From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 13:27:20 +0100
Subject: [Buildroot] [PATCH] xz-utils: needs threads
In-Reply-To: <1420800055-6710-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420800055-6710-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150109132720.4c793da5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  9 Jan 2015 07:40:55 -0300, Gustavo Zacarias wrote:
> It's one of the major features of the 5.2.0 release. Fixes:
> http://autobuild.buildroot.net/results/e86/e86e97ff7887f1bdc6bf913498392ff50f56ea88/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/xz/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
