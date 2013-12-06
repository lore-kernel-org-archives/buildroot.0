From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 09:06:29 +0100
Subject: [Buildroot] [PATCH 1 of 3] manual: remove references to
 uninstall commands
In-Reply-To: <CAAXf6LVVfX4KDPcT=jz-z1v2SF-9JO0zJsJiNgjWWpLjnXMFvg@mail.gmail.com>
References: <patchbomb.1386240845@argentina>
 <f2f1b59c4cfbf80a1592.1386240846@argentina>
 <52A0F94B.1030600@mind.be> <20131205233008.06272dd1@skate>
 <CAAXf6LVVfX4KDPcT=jz-z1v2SF-9JO0zJsJiNgjWWpLjnXMFvg@mail.gmail.com>
Message-ID: <20131206090629.01bdc423@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 6 Dec 2013 08:38:28 +0100, Thomas De Schampheleire wrote:

> Thanks for mentioning, I wasn't aware that -clean was also deprecated.
> To be sure, foo-dirclean will still be supported, right?

foo-dirclean is implemented in a generic way in the package
infrastructure, so there is no problem with foo-dirclean and it should
be kept, IMO.

The main problem with foo-uninstall and foo-clean is that it had to be
implemented by each package, but it was barely tested, especially
during package bumps.

> I will create another patch series to remove -clean, but as ThomasP
> said this should not block integration of this series already.

Indeed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
