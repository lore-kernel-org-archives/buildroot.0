From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 17:53:02 +0200
Subject: [Buildroot] Next major libftdi1-1.1
In-Reply-To: <2.d2dbde7bfe4fe960cb5a@polarstar>
References: <2.d2dbde7bfe4fe960cb5a@polarstar>
Message-ID: <20140930175302.25df10a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear daniel.sangue at sangue.ch,

On Tue, 30 Sep 2014 13:59:46 +0200, daniel.sangue at sangue.ch wrote:

> Please add the new major release of the lib FTDI. The new lib can exists alongside the other (libfdi.so and libftdi1.so) - so you could probably add the new package to the buildroot repository.
> 
>     source "package/libftdi/Config.in"
> +    source "package/libftdi1/Config.in"
> 
> Tested it for armv7 builds only.

Thanks. Could you submit a proper patch, as explained in our
documentation at
http://buildroot.org/downloads/manual/manual.html#submitting-patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
