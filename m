From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Mar 2019 15:58:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump to 0.3.5.8
In-Reply-To: <20190223075029.1838-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 23 Feb 2019 08:50:29 +0100")
References: <20190223075029.1838-1-bernd.kuhls@t-online.de>
Message-ID: <87ef78b2vm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://blog.torproject.org/new-releases-tor-0402-alpha-0358-03411-and-03312

 > Fixes CVE-2019-8955:
 > KIST can write above outbuf highwater mark
 > https://trac.torproject.org/projects/tor/ticket/29168

 > Updated license hash after upstream commit
 > https://gitweb.torproject.org/tor.git/commit/LICENSE?h=maint-0.3.5&id=efe55b88987c2539c218fdf1f46f16f9bdc3a8eb
 > which bumps copyright date to 2019.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Instead of cherry picking this, I have instead bumped the version to
0.3.4.11 for 2018.11.x.

-- 
Bye, Peter Korsgaard
