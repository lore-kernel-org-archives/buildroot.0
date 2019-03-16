From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Mar 2019 22:36:05 +0100
Subject: [Buildroot] [PATCH-for-master 2/2] package/iproute2: backport
 patch to fix compilation under glibc < 2.18
In-Reply-To: <20190225211147.14947-3-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 25 Feb 2019 22:11:47 +0100")
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-3-patrickdepinguin@gmail.com>
Message-ID: <87h8c2a4e2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > When compiling iproute2 using a toolchain containing glibc 2.17 and
 > older, it fails due to a missing definition of AF_VSOCK.

 > Add a submitted and accepted upstream patch to fix this issue.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
