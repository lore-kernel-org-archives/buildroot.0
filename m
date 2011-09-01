From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Sep 2011 09:12:13 +0200
Subject: [Buildroot] how BR download the linux kernel now
In-Reply-To: <CAAa76NQpfMaN-EQ6pBx6y6V-yJ3QUk+w0sQrD=iktdJ=qgHKgA@mail.gmail.com>
References: <CAAa76NTwjrB-6jbenSbGDpN0evxnV-TVx36DvdNcvWnVQEfr4w@mail.gmail.com>
 <CAAa76NQpfMaN-EQ6pBx6y6V-yJ3QUk+w0sQrD=iktdJ=qgHKgA@mail.gmail.com>
Message-ID: <20110901091213.775dcab8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Raymond,

Le Tue, 23 Aug 2011 16:30:29 -0400,
raymond zhao <raymond.zhao.ml@gmail.com> a ?crit :

> BR 2011.08 rc was released and I did not see this feature in there? Is
> it still going to happened in 2011.08 release?
> Please add this feature if possible, it is really useful.

The feature that allows to override the source directory for a package
hasn't been integrated in 2011.08 because it was too late in the
development cycle to integrate it.

However, I was posted yesterday a new version of the patches and I hope
to get them merged for the 2011.11. At least this time I am not late: I
posted the patches the exact day 2011.08 was released, so I couldn't do
earlier than that in the development cycle :-)

If you have the opportunity to test those patches, it would be great.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
