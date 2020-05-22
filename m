From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 14:06:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.10.1
 for security fixes
In-Reply-To: <20200522014026.15038-1-stefan@ott.net> (Stefan Ott's message of
 "Fri, 22 May 2020 03:40:26 +0200")
References: <20200522014026.15038-1-stefan@ott.net>
Message-ID: <875zcokwco.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Ott <stefan@ott.net> writes:

 > Fixes the following security vulnerabilities:
 > CVE-2020-12662: Unbound can be tricked into amplifying an incoming query
 >   into a large number of queries directed to a target.

 > CVE-2020-12663: Malformed answers from upstream name servers can be used
 >   to make Unbound unresponsive.

 > Signed-off-by: Stefan Ott <stefan@ott.net>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
