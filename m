From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jun 2012 09:20:33 +0200
Subject: [Buildroot] fails to build host-ncurses
In-Reply-To: <CAAfyv37nm-iTr78FzpDoNfrG9u7ARE7hnKWQV4vSgMXMN6BdQA@mail.gmail.com>
References: <CAAfyv37nm-iTr78FzpDoNfrG9u7ARE7hnKWQV4vSgMXMN6BdQA@mail.gmail.com>
Message-ID: <20120627092033.614b647c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 27 Jun 2012 00:06:41 +0200,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> Am I missing some host libs?

You're missing the static version of libc. Depending on your distro, it
might be installed through the libc6-dev package (Debian/Ubuntu), or
through the glibc-static package (or something similar on
Fedora/Redhat distros).

Basically, search for the package in your distro that will install the
libc.a file.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
