From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 21:40:58 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: mark 4.5.x as deprecated
In-Reply-To: <1427199306-24508-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427199306-24508-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150325214058.527781ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 24 Mar 2015 09:15:05 -0300, Gustavo Zacarias wrote:
> It was kept for the internal blackfin toolchain which has been removed
> since because of lack of maintenance and testing.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)

Both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
