From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 20:53:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 0.102.1
In-Reply-To: <20191120193616.21123-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 20 Nov 2019 20:36:16 +0100")
References: <20191120193616.21123-1-bernd.kuhls@t-online.de>
Message-ID: <87wobrzo0o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.clamav.net/pipermail/clamav-announce/2019/000043.html

 > Fixes CVE-2019-15961.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

For 2019.02.x and 2019.08.x I have instead bumped to 0.101.5, which
also needs a system libmspack like for 0.102, so I've also cherry-picked
the libmspack package addition.

-- 
Bye, Peter Korsgaard
