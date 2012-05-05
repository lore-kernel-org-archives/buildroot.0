From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 23:39:53 +0200
Subject: [Buildroot] [PATCH v3 resend] config: make it possible to
	specify which config file to use for 'make defconfig'
In-Reply-To: <1335633290-8734-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 28 Apr 2012 19:14:50 +0200")
References: <1335633290-8734-1-git-send-email-arnout@mind.be>
Message-ID: <87397ecno6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> So that this works:
 Arnout>  % make defconfig BR2_DEFCONFIG=~/buildroot-defconfig

 Arnout> Right now we have to do:

 Arnout>  % cp ~/buildroot-defconfig configs/buildroot_defconfig
 Arnout>  % make buildroot_defconfig

 Arnout> That would dirty the buildroot tree and requires it to be writable.

 Arnout> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Arnout> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
