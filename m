From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Apr 2016 23:27:07 +0200
Subject: [Buildroot] [PATCH] package/turbolua: new package
In-Reply-To: <1458228459-2401-1-git-send-email-m.niestroj@grinn-global.com>
References: <1458228459-2401-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <5700392B.6070506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Marcin,

  In addition to Thomas's comments:

On 03/17/16 16:27, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[snip]
> diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
> new file mode 100644
> index 0000000..f42f4ca
> --- /dev/null
> +++ b/package/turbolua/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_TURBOLUA
> +	bool "turbolua"
> +	depends on BR2_PACKAGE_LUAJIT
> +	depends on !BR2_ARM_INSTRUCTIONS_THUMB2
> +	help
> +	  Turbo.lua is a framework built for LuaJIT 2 to simplify the task of
> +	  building fast and scalable network applications. It uses a
> +	  event-driven, non-blocking, no thread design to deliver excellent
> +	  performance and minimal footprint to high-load applications while
> +	  also providing excellent support for embedded uses. The toolkit can
> +	  be used for HTTP REST API?s, traditional dynamic web pages through
> +	  templating, open connections like WebSockets, or just as high level
> +	  building blocks for native speed network applications.

  The lines of the help text are a bit too long. It should be wrapped at 72 
columns, where tab counts for 8, so 62 actual characters.


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
