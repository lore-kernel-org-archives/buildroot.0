From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Jun 2018 10:55:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/python: bump version to 2.7.15
In-Reply-To: <20180615163154.30551-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 15 Jun 2018 18:31:54 +0200")
References: <20180615163154.30551-1-bernd.kuhls@t-online.de>
Message-ID: <87602j2jqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Rebased patch 0009, removed patch 0035 after upstream commit
 > https://github.com/python/cpython/commit/0b91f8a668201fc58fa732b8acc496caedfdbae0

 > Updated license hash after 2018 bump.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

Judging from the (well hidden) release notes, this is probably also
something we want to backport to 2018.02.x?

https://github.com/python/cpython/blob/v2.7.15/Misc/NEWS.d/2.7.15rc1.rst

-- 
Bye, Peter Korsgaard
