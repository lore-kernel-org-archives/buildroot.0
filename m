From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:49:11 +0100
Subject: [Buildroot] [PATCH 6/8] package/opkg-utils: add missing
 dependencies for host build
In-Reply-To: <20210312200534.923-7-ryan.barnett@rockwellcollins.com> (Ryan
 Barnett's message of "Fri, 12 Mar 2021 14:05:32 -0600")
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-7-ryan.barnett@rockwellcollins.com>
Message-ID: <87y2ehsrco.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > opkg-utils is a collection of bash and python scripts which require
 > additional commands/tools be available for the bash scripts. The full
 > list of dependencies that the opkg-util scripts require is:

 >   bash
 >   binutils
 >   bzip2
 >   coreutils
 >   diffutils
 >   findutils
 >   grep
 >   gzip
 >   lz4
 >   python3
 >   sed
 >   tar
 >   xz

 > Since buildroot requires that bash, binutils, bzip2, gzip, sed and tar
 > be installed on the host system, only add dependencies on the
 > remaining host tools.

 > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
