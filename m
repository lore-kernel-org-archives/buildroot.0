From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:49:40 +0100
Subject: [Buildroot] [PATCH] privoxy: new package
In-Reply-To: <1455110610-27366-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455110610-27366-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160220154940.300c9c06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 10 Feb 2016 10:23:30 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in            |  1 +
>  package/privoxy/Config.in    | 12 ++++++++++++
>  package/privoxy/privoxy.hash |  3 +++
>  package/privoxy/privoxy.mk   | 16 ++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/privoxy/Config.in
>  create mode 100644 package/privoxy/privoxy.hash
>  create mode 100644 package/privoxy/privoxy.mk

Applied to next, thanks. Isn't this the kind of tool that would benefit
from having an init script ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
