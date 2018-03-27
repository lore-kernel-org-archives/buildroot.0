From: Eric Schwarz <eas@sw-optimization.com>
Date: Tue, 27 Mar 2018 15:38:24 +0200
Subject: [Buildroot] libopenssl in buildroot-2018.02
Message-ID: <b06bcfe21263864b9b35fdea9f15e99f@sw-optimization.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

the patches to be downloaded for the openssl-1.0.2n.tar.gz package are
defined in
     ./package/libopenssl/libopenssl.mk
by
     LIBOPENSSL_PATCH

The patches are stored with some suffix after the "patch" extension.
When those are checked-in using SVN and checked-out under Windows it
won't work since there are "?" in the filename.

* 
openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
* 
openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
* 
openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
* 
openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d

Apart, why have not those patches yet been applied to openssl master?

Cheers
Eric
