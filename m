From: Kevin Vigouroux <ke.vigouroux@laposte.net>
Date: Fri, 24 Apr 2020 17:00:52 +0200
Subject: [Buildroot] [Golang] Add support for a bootstrap binary
Message-ID: <87ftct2ajf.fsf@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Currently, on the supported systems, one way to build Go on the host
machine is to build it from a binary bootstrap toolchain because the
source bootstrap toolchain (Go 1.4) does not target some supported
architectures (ppc64le, aarch64...).

In practice, I would like to be able to build Go on a *aarch64*
machine. Then, cross-compiled Go packages to run them on an *arm*
machine.

References:
  - https://golang.org/doc/install/source#bootstrapFromBinaryRelease
  - https://golang.org/doc/install/source#environment ($GOHOSTOS and
  $GOHOSTARCH)

Best regards,
Kevin Vigouroux.
