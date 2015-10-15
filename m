From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Oct 2015 22:23:15 +0200
Subject: [Buildroot] [PATCH] sconeserver: use direct imagemagick disable
In-Reply-To: <1444913330-16605-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 15 Oct 2015 09:48:50 -0300")
References: <1444913330-16605-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8rj6fv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Disabling sconesite image isn't enough to avoid imagemagick
 > autodetection, and if it's present in the host (distro) but not in the
 > target it gets automatically picked up. Fixes:
 > http://autobuild.buildroot.net/results/377/37705926f3023395c54af0532ff95f0125fbaa66/

 > Also add a comment about autoreconf.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
