From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:09:29 +0100
Subject: [Buildroot] [PATCH 2/3] package/dhcpcd: create dhcpcd user
In-Reply-To: <20201226171745.2414764-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Dec 2020 18:17:44 +0100")
References: <20201226171745.2414764-1-fontaine.fabrice@gmail.com>
 <20201226171745.2414764-2-fontaine.fabrice@gmail.com>
Message-ID: <877dp3d612.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > privsep is supported since version 9.0.0 and
 > https://github.com/rsmarples/dhcpcd/commit/d5786118da1bad4c247631cae86344f1b249a8cb
 > It is enabled by default since
 > https://github.com/rsmarples/dhcpcd/commit/3a4c2e5604d72151b06ed365aa71493740a3ad75

 > So use --privsepuser to avoid that the detection mechanism finds a wrong
 > value from host and create it on the target

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=13416

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
