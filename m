From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Dec 2017 23:43:30 +0100
Subject: [Buildroot] [PATCH 2/2] flann: Disable find package for HDF5
In-Reply-To: <20171206144753.3603-1-johan.oudinet@gmail.com> (Johan Oudinet's
 message of "Wed, 6 Dec 2017 15:47:53 +0100")
References: <20171206144753.3603-1-johan.oudinet@gmail.com>
Message-ID: <87k1x6lbhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Oudinet <johan.oudinet@gmail.com> writes:

 > The HDF5 package is used by flann for testing purpose only and is
 > not part of buildroot packages. However, if present in the host, it will
 > be used and trigger the unsafe header/library path used in
 > cross-compilation error.

 > Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
