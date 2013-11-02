From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 02 Nov 2013 18:47:34 +0100
Subject: [Buildroot] github tarball urls: http vs https
In-Reply-To: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
References: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
Message-ID: <52753AB6.20904@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi Thomas,


> Hi,
>
> Packages that are hosted on github and downloaded with the tarball
> method, can either have a http or https URL. It seems that a download
> from http is redirected to the corresponding https URL. To avoid such
> an unnecessary redirect, we could update all github .mk files to use
> https directly.
>
> I vaguely recall a discussion on the mailing list about this, but I
> don't know what the outcome was. Was there a problem using the https
> URLs with respect to certificates?

It was my proposal.
Please look here:
http://lists.busybox.net/pipermail/buildroot/2013-October/079209.html

Regards,
Jerzy


> If we can clarify this point, we can cleanup and update the manual
> (which talks about http).
>
> Thanks,
> Thomas
>
