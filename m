From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:20:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix build with amqp
In-Reply-To: <20201031161421.231545-1-fontaine.fabrice@gmail.com>
References: <20201031161421.231545-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031222033.0699659a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 17:14:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> collectd unconditionally uses amqp_ssl_socket.h since version 5.11.0 and
> https://github.com/collectd/collectd/commit/e4808ad138de362fab5efa09648fbc101f97bd76
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/525abe0a5cca81ff517c9c07c092d85160c7eb62
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
