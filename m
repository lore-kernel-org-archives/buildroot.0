From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:46:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump to version
 9.11.10
In-Reply-To: <20190918170129.30890-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Sep 2019 19:01:29 +0200")
References: <20190918170129.30890-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhir5r12.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove all patches except first one (already in version)
 > - Update first patch
 > - Fix CVE-2019-6471: A race condition when discarding malformed packets
 >   can cause BIND to exit with an assertion failure

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
