From: Lars Reemts <lars.reemts@finalbit.de>
Date: Wed, 24 Aug 2011 17:25:20 +0200
Subject: [Buildroot] License for patches
Message-ID: <4E5517E0.30003@finalbit.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

we are using Buildroot in an embedded Linux project for one of our
customers. Discussing with the customer's lawyer the steps required by
the customer in order to conform to the various open-source licenses
involved, the following issue came up:

Buildroot is licensed under the GPL. The packages buildroot builds are
licensed under different licenses. Some of these liceses are
incompatible with the GPL (e.g. the BSD style license of openssl or the
LGPL license of uClibc).

Which license is relevant for the package specific patches distributed
by buildroot? Formally it must be the GPL. But if the patches are
distributed under the GPL, this would result in an unresolvable license
collision for some packages (e.g. openssl). All other patched packages
would be infected by the GPL which would forbid dynamic linking of a
proprietary software with e.g. uClibc.

I'm sure there must be a resolution but I have been unable to convince
the lawyer so far. What can I tell him to make him happy again?

Any ideas?

Best regards

Lars Reemts
