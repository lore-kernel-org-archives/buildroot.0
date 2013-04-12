From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Apr 2013 15:00:45 +0200
Subject: [Buildroot] [pull request v4] Pull request for branch yem-ext234
In-Reply-To: <cover.1365718555.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 12 Apr 2013 00:17:49 +0200")
References: <cover.1365718555.git.yann.morin.1998@free.fr>
Message-ID: <87fvyvrjia.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!

 Yann> This patch series enhances the ext2 fs backend to also build ext3
 Yann> and ext4 filesystems, and differentiate between ext2 rev0 and
 Yann> ext2 rev1 filesystems.

Committed series, thanks.

Notice: I did a quick test with a smallish ext4 (3.5MB) filesystem,
where the 1081 blocks extra for the journal wasn't enough, so I've
increased it to 1300 instead.

-- 
Bye, Peter Korsgaard
