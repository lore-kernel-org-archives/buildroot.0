From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Aug 2017 17:58:25 +0200
Subject: [Buildroot] [PATCH v2 3/4] python-automat: new package
In-Reply-To: <20170802055726.18461-4-yegorslists@googlemail.com>
References: <20170802055726.18461-1-yegorslists@googlemail.com>
 <20170802055726.18461-4-yegorslists@googlemail.com>
Message-ID: <418b145a-e1b1-2145-223b-1391e4f89b33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-08-17 07:57, yegorslists at googlemail.com wrote:
> +config BR2_PACKAGE_PYTHON_AUTOMAT
> +	bool "python-automat"
> +	select BR2_PACKAGE_PYTHON_ATTRS # runtime
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	help
> +	  Self-service finite-state machines for the programmer on the go.

 I had to rewrap this before applying to next. Please use the check-package
script before submitting your patches.

 Regards,
 Arnout

> +
> +	  https://github.com/glyph/Automat

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
