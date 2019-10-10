From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 10 Oct 2019 15:54:42 +0200
Subject: [Buildroot] How to get the (GIT) Version string into the source code
Message-ID: <b96c8d0a-48b2-9735-7c38-01cd7f826035@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm looking for a simple method to get the package version string used
by buildroot into the source code of that package. Unfortunately, the
GIT version information is stripped off. For the moment, I use the name
of the build directory and pass it to the code via Makefile, but maybe
there is a more elegant version.

Wolfgang
