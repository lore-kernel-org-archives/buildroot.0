From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2021 23:32:40 +0100
Subject: [Buildroot] [PATCH 06/10 v3] WIP: support/testing: update
 git-hash checks with new archive format
In-Reply-To: <74928f23343a32a47253eb2bedceb717ddb874b4.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <74928f23343a32a47253eb2bedceb717ddb874b4.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <a415b775-ca0e-45b5-aaa7-5d728604050b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/12/2020 12:01, Yann E. MORIN wrote:
> ** WIP: should be squashed into the commit that changes the git backend.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Note that you can do `git commit --squash` to generate a message that
automatically squashes with the previous ones when you do rebase -i. Or better
yet, --fixup, then the commit message is dropped entirely.

 Regards,
 Arnout
