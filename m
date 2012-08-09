From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Aug 2012 13:30:53 +0200
Subject: [Buildroot] [RFC] "select" vs. "depends on" : a proposal for a
 workaround
In-Reply-To: <201208091158.19469.yann.morin.1998@free.fr>
References: <201208072252.18028.yann.morin.1998@free.fr>
 <20120809114001.6e9d2a10@skate>
 <201208091158.19469.yann.morin.1998@free.fr>
Message-ID: <20120809133053.51033341@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 9 Aug 2012 11:58:19 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> Going this route can lead to over-complicated and over-cluterred
> Config.in files. We have to set a limit to where we want to go.

Right. I guess we can limit this do the package that are being
select'ed by others. Generally, this means the libraries and a few
other packages.

I must admit I still see this as a workaround for a
deficiency/limitation of kconfig. It's true that it will make our
package Config.in files a bit less obvious to understand.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
