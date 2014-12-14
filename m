From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 13:18:13 +0100
Subject: [Buildroot] dbus build fails since the bump of systemd to
	version 218
In-Reply-To: <548D6323.3010102@free.fr> (Thierry Bultel's message of "Sun, 14
 Dec 2014 11:14:59 +0100")
References: <548B6E4E.104@free.fr> <87wq5vp6fa.fsf@dell.be.48ers.dk>
 <548D6323.3010102@free.fr>
Message-ID: <87k31upgqi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thierry" == Thierry Bultel <tbultel@free.fr> writes:

Hi,

 >> What toolchain is this? According to upstream it is could be because of
 >> a binutils bug:
 >> 
 >> https://www.marshut.net/kttspt/build-error-with-218-undefined-reference-to-start-bus-error-map.html

 > This happens with buildroot toolchain, eglibc 2.18, gcc-4.8.x,
 > binutils 2.22 It does not happen with binutils-2.23.2 and
 > binutils-2.24

Ok, thanks for investigating it. It won't fix it for external
toolchains, but perhaps it is time to bump our default binutils version
to 2.24?

-- 
Venlig hilsen,
Peter Korsgaard 
