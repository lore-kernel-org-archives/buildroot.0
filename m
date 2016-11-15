From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 00:04:27 +0100
Subject: [Buildroot] [PATCH for/next] krb5: new package
In-Reply-To: <20161108005032.11340-1-arnout@mind.be>
References: <20161108005032.11340-1-arnout@mind.be>
Message-ID: <20161116000427.74c92b5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Nov 2016 01:50:32 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +# No buildroot packages exist for these so use the bundled ones.
> +KRB5_CONF_OPTS += \
> +	--without-system-libverto \
> +	--without-system-ss \
> +	--without-system-et

We generally don't like to use bundled libraries. Are those libraries
likely to be used by other packages? Or are they so specific to krb
stuff that it isn't worth having separate packages for them?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
