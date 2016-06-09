From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:14:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/vlc: configure.ac does not
 support --en/--disable-freerdp
In-Reply-To: <1463518124-29879-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463518124-29879-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160610001453.265bab46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 22:48:44 +0200, Bernd Kuhls wrote:
> Vlc configure does not allow disabling the optional dependency to
> freerdp:
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blob;f=configure.ac;h=e021546e284d7daefdb4d94f430eb0bc57722210;hb=HEAD#l1890
> 
> Vlc configure prints a warning that the option --disable-libfreerdp
> is not used:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc,
>  --disable-gtk-doc-html, --disable-doc, --disable-docs,
>  --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
>  --disable-libfreerdp
> 
> This can be seen for example in autobuilder logs:
> http://autobuild.buildroot.net/results/1a7/1a7893c13f6144e0ecd9f37f2f047c596ccedd35/build-end.log
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added new line before SoB (Thomas)
>     clarified patch comment (Thomas):
>     - freerdp is an optional dependency
>     - this patch does not fix a build error, the reference to the
>       autobuilder log is only present to show the problem

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
