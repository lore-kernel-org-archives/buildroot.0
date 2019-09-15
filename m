From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 09:20:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/chrony: drop musl patch
In-Reply-To: <20190914093227.4893-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Sep 2019 11:32:27 +0200")
References: <20190914093227.4893-1-fontaine.fabrice@gmail.com>
 <20190914093227.4893-2-fontaine.fabrice@gmail.com>
Message-ID: <87h85e3u18.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This patch is not needed as musl defines SCM_TIMESTAMPING_PKTINFO since
 > version 1.1.19 and
 > https://git.musl-libc.org/cgit/musl/commit/?id=c35a8bf456ca6ef74e3cc7c4d8f63572bc1e1167

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
