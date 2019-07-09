From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 10 Jul 2019 00:51:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: Bump to version
 s20190709
In-Reply-To: <20190709223625.4442-1-petr.vorel@gmail.com>
References: <20190709223625.4442-1-petr.vorel@gmail.com>
Message-ID: <20190709225157.GA20328@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Add 's' before release as this is in upstream tags and in sha256sum.asc.
> This prevents error:
> ERROR: No hash found for iputils-20190709.tar.gz

> Remove all patches (accepted in this release).
Sorry, commit message should have been with "bump" lowercase.

+ checked:
$ ./utils/test-pkg -p iputils
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed


Kind regards,
Petr
