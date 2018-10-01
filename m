From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 15:17:30 +0200
Subject: [Buildroot] [PATCH 2/2] haproxy: fix linking with lua
In-Reply-To: <20180928173519.9731-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 Sep 2018 19:35:19 +0200")
References: <20180928173519.9731-1-fontaine.fabrice@gmail.com>
 <20180928173519.9731-2-fontaine.fabrice@gmail.com>
Message-ID: <87k1n1rel1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use LUA_LIB_NAME to give lua library name otherwise haproxy can't find
 > it

 > Fixes:
 >  - http://autobuild.buildroot.net/results/28b6672188bb0082ac1467d3b45904880e3634f3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
