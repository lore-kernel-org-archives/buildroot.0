From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:47:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: security bump to
 version 8.3.0
In-Reply-To: <20201220175556.10038-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Dec 2020 18:55:56 +0100")
References: <20201220175556.10038-1-fontaine.fabrice@gmail.com>
Message-ID: <87im8vqymx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-14318: Crypto++ 8.3.0 and earlier contains a timing side

That sounds odd, giving that you are bumping to 8.3.0. Looking at the
bugtracker issue (https://github.com/weidai11/cryptopp/issues/869), I
believe the issue is in fact fixed in 8.3.0 and the above should have
said 8.2.0 instead.

I've updated the commit message to reflect that and added a link to the
bugtracker issue for more info and committed, thanks.

-- 
Bye, Peter Korsgaard
