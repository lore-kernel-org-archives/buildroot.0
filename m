From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:15:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] libpqxx: apply upstream compilation
 fix
In-Reply-To: <20180115205437.4916-1-james.knight@rockwellcollins.com>
References: <20180115205437.4916-1-james.knight@rockwellcollins.com>
Message-ID: <20180116231507.099d6daf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 15:54:37 -0500, James Knight wrote:

> diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
> index 372be603c59e3cfcf503131a33a9aaeca88475f2..f123db43a26b4729685ae78c5a57da18e19dd8f3 100644
> --- a/package/libpqxx/libpqxx.hash
> +++ b/package/libpqxx/libpqxx.hash
> @@ -1,3 +1,4 @@
>  # Locally computed:
>  sha256	81cac92458efd799fadb0374107464320d93eba71de05aedf21afb9c8dda7c3a	libpqxx-6.0.0.tar.gz
>  sha256	9e1c78fa302e4e9738bf3315b130429035c03fcb0f046531ccd977cb474f6b31	COPYING
> +sha256	b3611ceae216a01b770a997174f82ca8017dc2beed2db1d8f9574558bd736a3f	0001-include-sys-time.h-outside-fallback-select-55.patch

Having the hash for a patch that is part of Buildroot is useless (and
not even checked), so I've dropped the libpqxx.hash change, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
