From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:50:04 +0100
Subject: [Buildroot] [PATCH v2] gnutls: fix --disable-crywrap
In-Reply-To: <1450129196-15461-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450129196-15461-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215215004.282f0afc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Mon, 14 Dec 2015 18:39:56 -0300, Gustavo Zacarias wrote:
> Add a patch to really enable the --disable-crywrap option in gnutls.
> Fixes:
> http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5/
> 
> Status: sent upstream (mailing list).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This patch does not apply (probably because it was based in your tree
on other commits that are not in the official Buildroot git repo).
Also, it would be good if you could take into account the two comments
made by Baruch.

thomas at skate:~/projets/buildroot (master)$ git pwam 556658
Applying patch #556658 using 'git am -s -3'
Description: [v2] gnutls: fix --disable-crywrap
Applying: gnutls: fix --disable-crywrap
fatal: sha1 information is lacking or useless (package/gnutls/gnutls.mk).
error: could not build fake ancestor
Patch failed at 0001 gnutls: fix --disable-crywrap
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
