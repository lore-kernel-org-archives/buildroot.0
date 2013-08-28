From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 11:58:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] libffi: minor corrections in post
 install hooks
In-Reply-To: <1493594999.5624151.1377683339178.JavaMail.root@openwide.fr>
References: <1493594999.5624151.1377683339178.JavaMail.root@openwide.fr>
Message-ID: <20130828115849.3dc406f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas M?n?gale,

On Wed, 28 Aug 2013 11:48:59 +0200 (CEST), Nicolas M?n?gale wrote:
> In order to be sure that we just deal with the includes related with
> the actual package described into libffi.mk it is better to explicitly
> specify the version of the libffi we deal with into the post install
> hook.
> As dev files are deprecated in target rootfs target post install
> hook was also deleted.
> 
> Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
