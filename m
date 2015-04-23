From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:48:49 +0200
Subject: [Buildroot] [PATCH] mosquitto: remove ipv6 depends
In-Reply-To: <1429740838-8577-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429740838-8577-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150423094849.139651e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Apr 2015 19:13:58 -0300, Gustavo Zacarias wrote:
> The package was added after the last iteration of the non-ipv6
> toolchain removal, so adjust it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mosquitto/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
