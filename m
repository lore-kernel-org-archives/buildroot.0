From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 23:30:34 +0100
Subject: [Buildroot] Libcurl : to depend or not to depend ?
In-Reply-To: <8762dx4ntq.fsf@macbook.be.48ers.dk>
References: <8E5E9D7D337A4C58AD26215008FACEF4@JohanW7>
 <20120321162014.6e2fd485@skate>
 <AD9141CB33AC4D019D399FFCCB3E46D3@JohanW7>
 <8762dx4ntq.fsf@macbook.be.48ers.dk>
Message-ID: <20120321233034.618822e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 23:00:01 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Sagaert> I know what to do, but in case you need openssl and you also
>  Sagaert> want libcurl BUT without SSL there is no way to build it like
>  Sagaert> it is now.
> 
> What is the use case for wanting openssl and no ssl support in libcurl?

Well, you might want OpenSSL for say the web server on the device, but
you don't necessarily need SSL support in the curl you're using on your
device to do some misc HTTP downloads.

But again, I think the size impact of the SSL support in curl is most
likely very limited, so it's probably not very useful to make this
configurable.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
