From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Feb 2021 23:01:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: update path for tftpd
In-Reply-To: <20210206185640.140214-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Sat, 6 Feb 2021 18:56:40 +0000")
References: <20210206185640.140214-1-petr.vorel@gmail.com>
Message-ID: <87wnvk500o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > tftpd has been installed into /usr/sbin in 20210202
 > (in upstream commit 8d1420f tftpd: install into sbindir).

 > Thus remove hook which expected it in /usr/bin and tried to move it into
 > /usr/sbin.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/3d142a705f07d496b1342e04094cd03ce7d92994
 >  - http://autobuild.buildroot.net/results/dae643b2d23d74b5f91225d00e85c350861a0e8a
 >  - http://autobuild.buildroot.net/results/dcfcb082bc188e7f990e280c3fd5d971f32cc048

 > Fixes: ea422f9950 ("package/iputils: bump version to 20210202")

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 > Sorry for introducing regression.

Committed, thanks.

-- 
Bye, Peter Korsgaard
