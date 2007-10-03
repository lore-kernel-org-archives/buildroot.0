From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 04 Oct 2007 01:54:57 +0300
Subject: [Buildroot] Adding Cirrus  EP93XX  ARM to buildroot
In-Reply-To: <20071003204012.GE20951@aon.at>
References: <1191361900.4187.48.camel@localhost.localdomain>
	<4702D760.4020707@promwad.com> <20071003204012.GE20951@aon.at>
Message-ID: <47041DC1.8020301@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Depends a bit.. From the sounds, all but the configs should reside in
> generic parts.
> That said, I'm not too keen on building up a shadow of kernel.org, so
> please
> 1) update your patches against current linus tree (or -mm, however you
> see fit)
> 2) submit your patches upstream

Bernhard,

Let me not argee here. You are forcing "keep up-to-date" policy instead of
"stable release" policy.

Cirrus Patches may be not a part of buildroot but refer as URL on Cirrus web site.

In embedded world is it often that you have to stick to some old kernel version because
of dependency on 3rd components specific to that particular kernel version.

Take into account reasoning of usual linux developer - I do not want to update my kernel
patches for every (month,week) -mm released. I want to have a stable base - which remains stable
after half-of-year.

And submitting patches to mainstream takes long time. And we want Cirrus support now.

Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
