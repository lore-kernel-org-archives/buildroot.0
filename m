From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 21:37:36 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: fix headers installation path
In-Reply-To: <dea7363d337047b65baf36ceb7945e5ec6777f80.1525026592.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 29 Apr 2018 21:29:52 +0300")
References: <dea7363d337047b65baf36ceb7945e5ec6777f80.1525026592.git.baruch@tkos.co.il>
Message-ID: <87wowppzwf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libtomcrypt installs its headers by default in /usr/local/include under
 > the staging sysroot. This patch is not in the default search patch of

s/patch/path/.

Committed, thanks.

-- 
Bye, Peter Korsgaard
