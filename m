From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:37:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/openblas: fix detection of
 gfortran compiler
In-Reply-To: <20210212091511.9905-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 12 Feb 2021 10:15:10 +0100")
References: <20210212091511.9905-1-patrickdepinguin@gmail.com>
 <20210212091511.9905-2-patrickdepinguin@gmail.com>
Message-ID: <87v9ar2d64.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The compiler detection since openblas 0.3.8 added support for gcc 10, but
 > this broke detection of compilers created with crosstool-ng, or other
 > toolchains that have a package version containing a version like x.y.z where
 > at least one of x, y or z have more than one digit, for example
 > "Crosstool-NG 1.24.0".

 > See the reported issue for more details [1].

 > Backport the upstream patch that fixes it.

 > [1] https://github.com/xianyi/OpenBLAS/issues/3099

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
