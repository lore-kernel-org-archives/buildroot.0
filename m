From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 19:16:48 +0200
Subject: [Buildroot] [PATCH v3] faifa: new package
In-Reply-To: <CAHXCMMJg6Vsjd+rCU-DqDjUa0MBQzKEwNRjKg1OvkbZ1Jbq1Ew@mail.gmail.com>
References: <1401284346-2929-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140608183400.5c399805@free-electrons.com>
 <CAHXCMMJg6Vsjd+rCU-DqDjUa0MBQzKEwNRjKg1OvkbZ1Jbq1Ew@mail.gmail.com>
Message-ID: <20140608191648.389eebd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 8 Jun 2014 19:08:32 +0200, Samuel Martin wrote:

> Just nit and late, but why do you need override the whole commands?
> All of this could have been set in the FAIFA_INSTALL_TARGET_OPT
> variable (respectively in FAIFA_INSTALL_STAGING_OPT):
> 
> FAIFA_INSTALL_TARGET_OPT = \
>     PREFIX=/usr \
>     STRIP=/bin/true \
>     DESTDIR=$(TARGET_DIR) \
>     install
> 
> Just nitpicking ;-)

True. I believe it doesn't make a lot of difference in terms of code
factorization, so to me, both solutions are almost equivalent.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
