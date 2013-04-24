From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 06:38:29 +0000
Subject: [Buildroot] Plan of libffi support?
In-Reply-To: <20130422180104.2fd1513d@skate>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <20130422180104.2fd1513d@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D6339F9F24@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Arnout, mailinglist,

First of all many thanks for your quick review, I'm preparing a v2 set of patches which should be ready later today. 

Regarding your remark on libffi:

> Do you have plans to get ARC support in libffi <http://sourceware.org/libffi/> ? This library requires some architecture-specific bits,
> and is used as a dependency for the Python interpreter, but also more importantly for the glib library from the Gtk world. And this
> glib library is used as a dependency in gazillions of packages: Gtk+, GStreamer, Bluez-utils, Connman, and many, many more things. 

> So, we can live for a while without libffi support, but it would be good to know if libffi support is somewhere in 
> your plans in the future.

Yes, it makes perfect sense to add support for ARC here. So this is something that we are definitely planning to do in the coming
weeks. In fact, if you have other suggestions of packages that would require specific ARC support, please let me know, so that we
can plan for these as well (if it makes sense).

Thanks again,

Mischa
