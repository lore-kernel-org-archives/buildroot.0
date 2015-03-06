From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:39:27 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: added libglib2.hash
In-Reply-To: <1425680678-23461-1-git-send-email-petr.vorel@gmail.com>
References: <1425680678-23461-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150306233927.07804f24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Fri,  6 Mar 2015 23:24:38 +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/libglib2/libglib2.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/libglib2/libglib2.hash

Applied...

> 
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> new file mode 100644
> index 0000000..38981ab
> --- /dev/null
> +++ b/package/libglib2/libglib2.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:

... but I changed this to a reference to the hash file available from
the glib official web site, since they actually provided a sha256.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
