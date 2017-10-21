From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 15:50:51 +0200
Subject: [Buildroot] [PATCH 01/12] dumb-init: new package
In-Reply-To: <20171019002257.27646-1-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
Message-ID: <ff021239-a980-ef2c-1c62-393b324d87a6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Christian,

 We were about to apply but then we thought:

On 19-10-17 02:22, Christian Stewart wrote:
> +config BR2_PACKAGE_DUMB_INIT_STATIC
> +	bool "build static"
> +	help
> +	  Enables static compilation for dumb-init.

 Is it really useful to have this as an option? In practice you'll always want
to link statically, no?

 If you're OK with this I can remove the option while applying, no need to
respin just for this.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
