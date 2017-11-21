From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 21 Nov 2017 19:04:10 +0000
Subject: [Buildroot] [2/3] lttng-libust: bump version to 2.10.0
In-Reply-To: <20171120232006.22588-2-eeppeliteloop@gmail.com>
References: <20171120232006.22588-2-eeppeliteloop@gmail.com>
Message-ID: <1511291049.19578.1.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-11-20 at 18:20 -0500, Philippe Proulx wrote:
> diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
> index e080361a57..dd77690fef 100644
> --- a/package/lttng-libust/lttng-libust.hash
> +++ b/package/lttng-libust/lttng-libust.hash
> @@ -1,3 +1,3 @@
> -# From http://lttng.org/files/lttng-ust/lttng-ust-2.9.0.tar.bz2.{md5,sha1}
> -md5 77f3378ba37a36801420bce87b702e9c  lttng-ust-2.9.0.tar.bz2
> -sha1 9937eae64540821b8597cce081e92be76e6b5568  lttng-ust-2.9.0.tar.bz2
> +# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.0.tar.bz2.{md5,sha1}
> +md5 cc1f0938fa0d46d8d400864de0c1da02  lttng-ust-2.10.0-rc2.tar.bz2
> +sha1 aba45026b05939a83b8d29414927ac8e2ce5c4a8  lttng-ust-2.10.0-rc2.tar.bz2


Looks like the hashes are for the wrong file, as the .mk is downloading
2.10.0, not 2.10.0-rc2.
