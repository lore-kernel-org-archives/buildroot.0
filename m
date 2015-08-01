From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Aug 2015 10:18:47 +0200
Subject: [Buildroot] buildroot: errors with libstdc++v3
In-Reply-To: <BAY168-W73304982B636B854C06355E98A0@phx.gbl>
References: <BAY168-W73304982B636B854C06355E98A0@phx.gbl>
Message-ID: <20150801101847.1c451753@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Burg,

On Fri, 31 Jul 2015 13:35:07 -0600, Jan Burg wrote:

> I'm trying to build a uclibc-ng toolchain for arm via buildroot in
> Debian. During the end of the build process, I'm getting errors with
> libtool linking and libstdc++v3. I searched and found that someone
> with similar problems just edited the Makefiles in the libstdc++v3
> subfolder to force 'CPPFLAGS = -fPIC', and I tried this, but it
> didn't make a difference. This is the output I'm getting:

Can you please:

 1/ Retry after doing a "make clean all". See the explanation at
    http://buildroot.org/downloads/manual/manual.html#full-rebuild.

 2/ Indicate the Buildroot version you're using, and attach your
    complete Buildroot .config that reproduces the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
