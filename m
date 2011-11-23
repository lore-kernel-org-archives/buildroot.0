From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Wed, 23 Nov 2011 08:17:24 -0600
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <20111123092547.2898f799@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <20111123092547.2898f799@skate>
Message-ID: <000601cca9ea$a02df6b0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>Basically you have the choice of :
>
> * Generating your system with Buildroot, then manually build EtherCAT
>   outside of Buildroot using the Buildroot cross-compiler and the
>   kernel built by Buildroot. Advantages: I don't see any, except maybe
>   the fact that you don't need to learn out to create packages in
>   Buildroot.

That, and I am already trying this approach.  If there are just one or two
small things to do along this approach, it might be easier to stick with it.
For example, if there was just an easy way to do something like 'make
modules' then this approach might be quickest.

> Drawbacks: it might actually be *harder* to achieve than
>   to create a package in Buildroot, and your build process is no
>   longer nicely integrated.

Is the 'make modules' idea considered hard?

> * Add a package in Buildroot. Requires learning a bit about how to
>   create packages (but our documentation on this is quite good I
>   think, and the Buildroot source tree is full of examples).

I believe another poster sent a link to read about this, so I will look at
that.  In the meantime, can you comment on the first part of this email?

Thanks.
