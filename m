From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:20:22 +0100
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
Message-ID: <20151128192022.6bc8d7fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Sat, 28 Nov 2015 16:18:27 -0200, Sergio Prado wrote:

> The idea is use the implementation from NetBSD. Should queue.h stays inside
> its package directory or should we create a repository for it? Another
> option is to download the NetBSD sources from [1] but it is too big
> (~140M). What is the best option?

Just add it inside the package directory. See package/makedevs/ for an
example.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
