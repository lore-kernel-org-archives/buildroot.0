From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Sep 2019 17:11:01 +0200
Subject: [Buildroot] [git commit] package/iptables: bump to version 1.8.3
In-Reply-To: <20190703215603.AB1EE8270C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 3 Jul 2019 23:55:27 +0200")
References: <20190703215603.AB1EE8270C@busybox.osuosl.org>
Message-ID: <87impo1fui.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=326a9ae2e5cd1e13abd1ea3de2a17909086e221c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Drop upstream patches.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x and 2019.05.x as this fixes a buffer overflow in
iptables-save parsing.

-- 
Bye, Peter Korsgaard
