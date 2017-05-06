From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 14:45:41 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <CAFGQKxefZ5eA+aQ9WqWR9J8GN_4oOoPApUPBOGebuC7YeHSONQ@mail.gmail.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
 <CAFGQKxefZ5eA+aQ9WqWR9J8GN_4oOoPApUPBOGebuC7YeHSONQ@mail.gmail.com>
Message-ID: <20170506144541.36687ea3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 6 May 2017 10:14:57 +0100, Martin Bark wrote:

> I had been thinking for a while about removing
> BR2_PACKAGE_NODEJS_MODULES_EXPRESS
> and BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT given you can just set them
> with BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL.  They are also not that useful
> since they choose the latest version meaning builds are not even
> reproducible.  BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL allows you to install
> them and choose the exact version you want.
> 
> Since they also cause build errors i think they should go.  Node 7.10.0 was
> just released so i'll submit a patch set to upgrade node and remove the
> express and coffee script settings.

Agreed with the proposal of removing those options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
