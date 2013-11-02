From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 2 Nov 2013 17:53:26 +0100
Subject: [Buildroot] github tarball urls: http vs https
Message-ID: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Packages that are hosted on github and downloaded with the tarball
method, can either have a http or https URL. It seems that a download
from http is redirected to the corresponding https URL. To avoid such
an unnecessary redirect, we could update all github .mk files to use
https directly.

I vaguely recall a discussion on the mailing list about this, but I
don't know what the outcome was. Was there a problem using the https
URLs with respect to certificates?

If we can clarify this point, we can cleanup and update the manual
(which talks about http).

Thanks,
Thomas
