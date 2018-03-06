From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Mar 2018 11:07:55 +0100
Subject: [Buildroot] [PATCH] iptables: fix build with older kernel
 headers
In-Reply-To: <732e96c8f30e874d16bc42df3e721b3386cf7da7.1520312753.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 6 Mar 2018 07:05:53 +0200")
References: <732e96c8f30e874d16bc42df3e721b3386cf7da7.1520312753.git.baruch@tkos.co.il>
Message-ID: <87fu5dqzyc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > iptables version 1.6.2 uses the BPF_OBJ_GET macro that is only available
 > since kernel version 4.4. Add a patch fixing the detection of the
 > feature availability.

 > Fixes:
 > http://autobuild.buildroot.net/results/e67/e670548c4b250e8a102a4929cafa85634fc79a3d/
 > http://autobuild.buildroot.net/results/1a7/1a7ab509440c9acacf606f238b8989d9b4287d52/
 > http://autobuild.buildroot.net/results/555/55583e20bcdf602132c074e08d1a49507d5a48ad/

 > Cc: Antoine Tenart <antoine.tenart@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
