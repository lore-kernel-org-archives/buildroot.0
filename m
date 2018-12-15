From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 11:26:54 +0100
Subject: [Buildroot] [PATCH v2 1/3] system cfg: update mkpasswd SHA
 option txt
In-Reply-To: <1544061989-7450-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 5 Dec 2018 20:06:27 -0600")
References: <1544061989-7450-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87va3vaxw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > This patch drops the comment about checking the C libraries version as
 > they now all support it by default
 >     glibc 2.7+
 >     uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
 >     musl 1.1.14+

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v1 -> v2
 > [Yann
 >  - Suggest this patch content is split out from the change of default
 >    method to SHA256
 >  - then -> than in help text

Committed, thanks.

-- 
Bye, Peter Korsgaard
