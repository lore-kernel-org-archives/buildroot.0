From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:17:19 +0200
Subject: [Buildroot] [PATCH v3 1/1] dcron: new package
In-Reply-To: <1405451436.8571.5.camel@Nokia-N900>
References: <1404814892-28531-1-git-send-email-alvaro.gamez@hazent.com>
 <20140715205633.4730fa1e@free-electrons.com>
 <1405451436.8571.5.camel@Nokia-N900>
Message-ID: <20140715211719.0ea2e053@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M.,

On Tue, 15 Jul 2014 21:10:36 +0200, Alvaro G. M. wrote:

> Thank you for all your additional fixes. I'll try to make it easier
> for everyone next time, It seems clear there were too many errors on
> this small contribution.

That's perfectly fine, we can't expect all contributions from newcomers
to immediately be perfect. Your contributions are very welcome.

> I'll take a look at the init script. I hadn't thought about it
> because I tipically run it directly on inittab.

Ah, ok. Still, I believe an init script would be welcome, as we
typically bundle a basic init script in any package that has a daemon,
so that it kind of works out of the box for Buildroot users.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
