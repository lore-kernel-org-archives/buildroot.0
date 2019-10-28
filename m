From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 14:06:23 +0100
Subject: [Buildroot] [PATCH 1/3] package/collectd: add grpc support
In-Reply-To: <20190610154530.26937-1-fontaine.fabrice@gmail.com>
References: <20190610154530.26937-1-fontaine.fabrice@gmail.com>
Message-ID: <20191028140623.7b548b00@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Jun 2019 17:45:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use --with-libgrpc++ option as otherwise collectd will try to find
> grpc++.pc which is not available
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in   | 17 +++++++++++++++++
>  package/collectd/collectd.mk |  7 ++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Series applied to master, thanks. I had to rework a bit PATCH 1/3 since
we dropped the host gcc 4.8 option, as we now always require gcc 4.8.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
