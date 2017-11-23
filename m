From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:22:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: add optional support for
 pcre2
In-Reply-To: <20171031183657.27406-2-bernd.kuhls@t-online.de>
References: <20171031183657.27406-1-bernd.kuhls@t-online.de>
 <20171031183657.27406-2-bernd.kuhls@t-online.de>
Message-ID: <20171123232236.75b99266@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 19:36:57 +0100, Bernd Kuhls wrote:
> Renamed --with-libpcre to --with-libpcre1. Currently --with-libpcre
> activates pcre1 support but this can change in the future to pcre2:
> https://github.com/git/git/blob/df7fd961a9d9ba60840ffc0868d36cc3db2aec74/configure.ac#L258
> 
> Please note that we cannot use --with-/--without because it will lead
> to an error reported by configure, for example
> 
>     --with-libpcre1 --without-libpcre2
> 
> will produce
> 
> configure: error: Only supply one of --with-libpcre1 or --with-libpcre2!
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed bug when "--with-libpcre1 --without-libpcre2" is used

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
