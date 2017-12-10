From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 20:59:52 +0100
Subject: [Buildroot] [PATCH] package/fswebcam: change tarball
 compression to xz
In-Reply-To: <20171210175457.1456-1-mlang@blind.guru> (Mario Lang's message of
 "Sun, 10 Dec 2017 18:54:57 +0100")
References: <20171210175457.1456-1-mlang@blind.guru>
Message-ID: <874loyxsjr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mario" == Mario Lang <mlang@blind.guru> writes:

 > Verified equality of underlying tarball with
 >   tarname=http://www.firestorm.cx/fswebcam/files/fswebcam-20140113.tar
 >   test "$(wget -qO- $tarname.gz|zcat|sha256sum -)" = "$(wget -qO- $tarname.xz|xzcat|sha256sum -)"

 > Signed-off-by: Mario Lang <mlang@blind.guru>

Committed, thanks.

-- 
Bye, Peter Korsgaard
