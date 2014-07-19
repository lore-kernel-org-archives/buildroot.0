From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 17:14:27 +0200
Subject: [Buildroot] [PATCH 1/2] libmemcached: disable libtest
In-Reply-To: <1405780534-691-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405780534-691-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140719171427.4f37d317@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 19 Jul 2014 11:35:33 -0300, Gustavo Zacarias wrote:
> This allows libmemcached to be enabled for musl and uClibc as well.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libmemcached/Config.in                     |  6 ++--
>  .../libmemcached-01-disable-tests.patch            | 32 ++++++++++++++++++++--
>  package/php-memcached/Config.in                    |  6 ++--
>  3 files changed, 33 insertions(+), 11 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
