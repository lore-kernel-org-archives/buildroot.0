From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2014 14:17:00 +0100
Subject: [Buildroot] [PATCH 06/10] package/sysvinit: drop tty1/2
In-Reply-To: <1415969096-3032-7-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141114141700.0e02688a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 14 Nov 2014 09:44:52 -0300, Gustavo Zacarias wrote:
> We don't do it for busybox init so do the same for consistency here.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sysvinit/inittab | 3 ---
>  1 file changed, 3 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, this one should go in 2014.11.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
