From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 11:51:42 +0200
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: tweak
 kernel-headers < 5.6 logic
In-Reply-To: <20200425094139.9C1168FEFF@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 25 Apr 2020 11:56:03 +0200")
References: <20200425094139.9C1168FEFF@busybox.osuosl.org>
Message-ID: <87o8qyrbyp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=74a865b1fc85352b814d032fa8725ace13f27eca
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The reason why the external wireguard kernel module is not allowed with
 > kernel headers >= 5.6 is that wireguard is included in the upstream kernel
 > since 5.6 rather than some kind of (fixable) incompatibility issue.  Adjust
 > the comment to make that clear.

 > While we're at it, drop the redundant !5.6 dependency on the kernel headers
 > dependency comment.  If headers are older than 3.10, then they are also
 > older than 5.6, so the statement is redundant.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
