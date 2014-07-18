From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:56:25 +0200
Subject: [Buildroot] [PATCH] gcc 4.9.x: Exclude for PPC SPE because of
 PR60102
In-Reply-To: <1405681841-2943-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405681841-2943-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140718195625.61ce7c23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 18 Jul 2014 08:10:41 -0300, Gustavo Zacarias wrote:
> Exclude gcc 4.9.x for PowerPC SPE toolchains because of an ICE
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
> There's a patch available but it's somewhat intrusive with PPC in
> general and hasn't been well tested yet.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/Config.in.host | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
