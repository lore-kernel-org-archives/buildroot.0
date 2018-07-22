From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 22 Jul 2018 14:27:03 +0200
Subject: [Buildroot] [RFC v3 2/4] meson: change from global to per
 package cross-compilation.conf
In-Reply-To: <20180719204355.10465-2-ps.report@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-2-ps.report@gmx.net>
Message-ID: <20180722122703.GB9618@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-07-19 22:43, Peter Seiderer wrote:
> Add FOO_MESON_CFLAGS, FOO_MESON_LDFLAGS and FOO_MESON_CXXFLAGS
> variables to allow per package additional flags.
>
> Change to buildtype plain as all compiler/linker flags forcing
> debug/release are already given via the cross-compilation.conf
> file.
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

--
ELB
