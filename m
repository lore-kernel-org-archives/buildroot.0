From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 14:45:30 +0100
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <54ABC247.9030500@zacarias.com.ar>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
 <54ABC247.9030500@zacarias.com.ar>
Message-ID: <20150106144530.6571a518@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 06 Jan 2015 08:08:55 -0300, Gustavo Zacarias wrote:

> Out of curiosity, did you try an allyespackageconfig build with this
> one? Major automake bumps tend to break some autoreconf'ed packages that
> use deprecated features.

When I saw Vicente's patch, I quickly skimmed through the release notes
of automake 1.15, and I didn't see anything too scary. I think we could
apply and let the autobuilders tell us if anything breaks.

But indeed, a little bit of additional testing would be good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
