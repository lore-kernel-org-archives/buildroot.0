From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 11:24:16 +0100
Subject: [Buildroot] [PATCH v2] package/olsr: needs -fPIC to avoid build
 failure
In-Reply-To: <20200120145147.22650-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 20 Jan 2020 15:51:47 +0100")
References: <DM6PR12MB2876F2A5F2BBD3A59DD336DFD9320@DM6PR12MB2876.namprd12.prod.outlook.com>
 <20200120145147.22650-1-giulio.benetti@benettiengineering.com>
Message-ID: <87blqgm0j3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > When building on Arc, Microblaze, Riscv32, Riscv64, package olsr needs
 > to be compiled with -fPIC, so append -fPIC to CFLAGS when invoking make
 > by default, since it seems to be mandatory in general and it's harmless
 > for other architectures.

 > Fixes:
 > http://autobuild.buildroot.net/results/9d6/9d6d69133789aba16daeb6dc53721597e6be9806/
 > http://autobuild.buildroot.net/results/b85/b85d27b3a4bab5d68460401ff49e624177d55afa/
 > http://autobuild.buildroot.net/results/0d3/0d3489b14f4f4f0d4837d00209b5c1ee8d6f6a98/
 > http://autobuild.buildroot.net/results/d9a/d9a143c8e9a175741acfafd17b63544d04744ac9/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
