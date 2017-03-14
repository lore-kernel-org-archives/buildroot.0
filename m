From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:22:40 +0100
Subject: [Buildroot] [PATCH 1/3] libgtk3: remove non-existent configure
 options
In-Reply-To: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
References: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
Message-ID: <20170314232240.4a614464@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 11:46:26 +0000, Vicente Olivert Riera wrote:
> From config.log:
> 
> configure: WARNING: unrecognized options: --disable-doc, --disable-docs,
> --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
> --enable-gtk2-dependency, --disable-introspection
> 
> Remove non-existent --enable-gtk2-dependency and --disable-introspection
> configure options from libgtk3.mk.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libgtk3/libgtk3.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
