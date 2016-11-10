From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 09:18:08 +0100
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <20161110044245.mpwgroempys43o27@tarshish>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
 <20161109212812.39399895@free-electrons.com>
 <37cfb466-91a2-2434-24a4-dbd13ddfbc0f@openmailbox.org>
 <20161110044245.mpwgroempys43o27@tarshish>
Message-ID: <20161110091808.06ceb521@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 06:42:45 +0200, Baruch Siach wrote:

> On Wed, Nov 09, 2016 at 11:01:12PM +0100, C?dric Marie wrote:
> > Roughly, add dependency on ninja, add an option in cmake configure step (-G
> > ninja) and use ninja instead of make in build and install commands.  
> 
> Does that mean that we won't be able to use the host distro installed cmake? 
> Not so good in terms of build time. I guess it offsets most of the build time 
> gain in moving to ninja, if not more.

This is one of the reasons why I want to have this as an option, at
least initially. We clearly want to keep the nice benefit of using the
system-provided CMake.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
