From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:43:51 +0100
Subject: [Buildroot] [PATCH 2/8] package/opkg-utils: install only
 utility scripts
In-Reply-To: <20210312200534.923-3-ryan.barnett@rockwellcollins.com> (Ryan
 Barnett's message of "Fri, 12 Mar 2021 14:05:28 -0600")
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-3-ryan.barnett@rockwellcollins.com>
Message-ID: <877dm1u660.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > When `make install` is run to install the opkg-utils scripts, it also
 > invokes building of the man page for opkg-build. The generation of the
 > man page requires `pod2man` executable which is a part of perl.

 > Since buildroot does not support man pages in the host directory,
 > patch the opkg-utils Makefile to separate the installation of man
 > pages and utility scripts.

 > With the options to install man pages and utils separately, only
 > install the opkg-utils scripts.

 > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
