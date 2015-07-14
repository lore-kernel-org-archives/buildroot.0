From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:54:46 +0200
Subject: [Buildroot] [PATCH] package/libmemcached: disable documentation
In-Reply-To: <1431382192-3141-1-git-send-email-romain.naour@openwide.fr>
References: <1431382192-3141-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150715005446.5fafbc8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 12 May 2015 00:09:52 +0200, Romain Naour wrote:
> libmemcached fail to build the documentation/man due to
> an python sphinx error.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> This is probably an error throw by my Fedora 21 host.
> ---
>  .../libmemcached/0004-disable-doc-and-man.patch    | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libmemcached/0004-disable-doc-and-man.patch

I don't really like the patch because it's clearly not upstreamable,
but:

 1/ The existing other 3 patches we have are also non-upstreamable

 2/ Upstream uses the Bazaar version control system, which is probably
    the most efficient thing you can do to make sure nobody will be
    interested in contributing to your project :-)

So, let's not care about this patch not being in an upstreamable state.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
