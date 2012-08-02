From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 16:56:42 +0200
Subject: [Buildroot] Package informations, online and updated
In-Reply-To: <CA+wH294hkqsmAA-KdCPuefNYkNvM6VkZj5cmxkNUjdnEZq6FxQ@mail.gmail.com>
References: <20120731213729.49c4b3ee@skate>
 <CA+wH296kBL8ZhhrHW7KCdrvFRuhB3-B=H2yJwZTyu75A8FhJyA@mail.gmail.com>
 <20120802163133.7c19d637@skate>
 <CA+wH294hkqsmAA-KdCPuefNYkNvM6VkZj5cmxkNUjdnEZq6FxQ@mail.gmail.com>
Message-ID: <20120802165642.677b9915@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 2 Aug 2012 15:53:44 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> uscan: http://manpages.debian.net/cgi-bin/man.cgi?query=uscan
> http://anonscm.debian.org/gitweb/?p=devscripts/devscripts.git;a=blob;f=scripts/uscan.pl
> 
> uscan wants to find a separate 'watch' file inside a debian/ dir. It
> actually looks like it might not be that hard to hack up uscan.pl so
> it just takes the watch line as an argument (though it's been a number
> of years since I hacked any Perl), then each package could have a
> check-upstream-version target which uses the watch line defined in
> that packages makefile and invokes the buildroot 'fork' of uscan.pl to
> check whether a newer release is available upstream. I don't know if
> any other distros have a similar sort of system, it just strikes me
> there's not much point reinventing the wheel here and it's handy to be
> able to just lift the watch regex from the debian/watch file for many
> packages.

Looks nice. Patches? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
