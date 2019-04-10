From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Apr 2019 23:05:25 +0200
Subject: [Buildroot] [PATCH v2] package/coreutils: allow building
 individual binaries
In-Reply-To: <20190410201746.14678-1-mmayer@broadcom.com> (Markus Mayer's
 message of "Wed, 10 Apr 2019 13:17:46 -0700")
References: <20190410201746.14678-1-mmayer@broadcom.com>
Message-ID: <87r2a9r2p6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

 > We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
 > so that coreutils can be built and installed as individual binaries.
 > It can be used if the target file system doesn't support symlinks or
 > symlinks are undesirable.

Out of interest, what file system is that?

 > The approach is modelled after Busybox's similarly named configuration
 > option.

The use case for individual binaries for busybox is afaik mainly for
stuff like selinux, where you may want to have different policies for
the different applets.

-- 
Bye, Peter Korsgaard
