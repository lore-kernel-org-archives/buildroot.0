From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:15:15 +0200
Subject: [Buildroot] [PATCH v2 1/3]
 testing/tests/package/test_openjdk.py: bump kernel version to 5.10.34
In-Reply-To: <20210504210026.1916260-1-aduskett@gmail.com> (Adam Duskett's
 message of "Tue, 4 May 2021 14:00:24 -0700")
References: <20210504210026.1916260-1-aduskett@gmail.com>
Message-ID: <87tundxqfg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Kernel 4.16.7 is old enough to produce the "multiple definition of `yylloc'"
 > error which is fixed in newer versions.

 > Bump the test kernel version from 4.16.7 to 5.10.34 to prevent this error wwhen
 > building the test image.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
