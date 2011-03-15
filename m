From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 23:53:33 +0100
Subject: [Buildroot] buildroot directive for acyion after configuring
In-Reply-To: <AANLkTinUEkDjVg4VnRJPCqvrF-CuGKmPppZCkmSz9gTE@mail.gmail.com>
References: <AANLkTi=iLXet_5auTP_mp1KzsY9wr=FOQVRNVZk+Q0dg@mail.gmail.com>
	<20110315111315.5d5a48f5@surf>
	<AANLkTinUEkDjVg4VnRJPCqvrF-CuGKmPppZCkmSz9gTE@mail.gmail.com>
Message-ID: <20110315235333.0131034e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2011 04:06:34 -0700
bao bui <buiqbao@gmail.com> wrote:

> After configuring, the Makefile has the EXTRALIBS variable as
> following
> 
> EXTRALIBS= -lcupsimage -lcups -ltiff -ljpeg -lpng
> -Wl,-Bsymbolic-functions -lgssapi_krb5 -lkrb5 -lk5crypto -lcom_err
> -lssl -lcrypto -lz -lpthread -lm -lcrypt -ldl -lm  -lstdc++
> -lfontconfig
> 
> I don't have libgssapi_krb5 libkrb5 libk5crypto libcom_err in
> buildroot library. I don't know where these option come from, maybe
> the configure script probes the host system.

Then it should be fixed by passing the appropriate values
to ./configure.

> I got nothing. So I don't know how to fix it axcept modify the
> Makefile after configuring.
> Do you have any idea about this?

Please post the full build log, and all files named "config.log" inside
output/build/espgs-8.15.4/ and its subdirectories.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
