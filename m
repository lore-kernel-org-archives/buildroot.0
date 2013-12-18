From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:39:10 +0100
Subject: [Buildroot] [PATCH 1/1] package: add <pkg>_VERSION_MAJOR
	variable
In-Reply-To: <1387390802-30247-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1387390802-30247-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <CAAXf6LUCm6YnYV4yWXYrEJcq7b-xkJKRzr8AbQwpwMjO9Osa8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 18, 2013 at 7:20 PM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/cmake/cmake.mk               |    5 +++--
>  package/gnutls/gnutls.mk             |    5 +++--
>  package/gtk2-engines/gtk2-engines.mk |    5 +++--
>  package/ipsec-tools/ipsec-tools.mk   |    5 +++--
>  package/libart/libart.mk             |    5 +++--
>  package/libglade/libglade.mk         |    5 +++--
>  package/libsigc/libsigc.mk           |    5 +++--
>  package/lighttpd/lighttpd.mk         |    5 +++--
>  package/linphone/linphone.mk         |    5 +++--
>  package/midori/midori.mk             |    5 +++--
>  package/mysql_client/mysql_client.mk |    5 +++--
>  package/nano/nano.mk                 |    5 +++--
>  package/ntp/ntp.mk                   |    5 +++--
>  package/nut/nut.mk                   |    5 +++--
>  package/qt/qt.mk                     |    5 +++--
>  package/qt5/qt5.mk                   |    5 +++--
>  package/rpm/rpm.mk                   |    5 +++--
>  package/ruby/ruby.mk                 |    5 +++--
>  package/sdl_gfx/sdl_gfx.mk           |    5 +++--
>  package/squid/squid.mk               |    5 +++--
>  20 files changed, 60 insertions(+), 40 deletions(-)

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>


Jerzy: how did you determine the list of files to change? Manually
opening all of them, or some more automated method?

Thanks,
Thomas
