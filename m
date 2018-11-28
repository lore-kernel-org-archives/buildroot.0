From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:40:06 +0100
Subject: [Buildroot] [PATCH 14/15] erlang-p1-eimp: New package
In-Reply-To: <20181126110807.31431-15-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
 <20181126110807.31431-15-johan.oudinet@gmail.com>
Message-ID: <20181128224006.376ace2f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Nov 2018 12:08:06 +0100, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/erlang-eimp/Config.in      | 12 ++++++++++++
>  package/erlang-eimp/erlang-eimp.mk | 13 +++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/erlang-eimp/Config.in
>  create mode 100644 package/erlang-eimp/erlang-eimp.mk

On this one you forgot to update the DEVELOPERS file with this new
package, so I did so when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
