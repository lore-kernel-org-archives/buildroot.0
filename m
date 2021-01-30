From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:44:30 +0100
Subject: [Buildroot] [PATCH-2020.11.x]
 support/dependencies/check-host-cmake.mk: gerbera needs cmake 3.14+
In-Reply-To: <20210129095710.31193-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Jan 2021 10:57:10 +0100")
References: <20210129095710.31193-1-peter@korsgaard.com>
Message-ID: <871re2vh4h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/871/8717612ae32cc491b868f37fbbc960c16b562877/

 > Since the security bump to gerbera 1.6.4, gerbera now needs cmake 3.14+,
 > whereas Buildroot currently enforces 3.10+.

 > As a fix, bump the requirement to 3.14+ when gerbera is enabled.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
