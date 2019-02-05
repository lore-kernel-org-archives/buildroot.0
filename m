From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 14:26:51 +0100
Subject: [Buildroot] [PATCH] package/moarvm: resolve libtommath name
 collision
In-Reply-To: <20190205135803.07660a5f@windsurf> (Thomas Petazzoni's message of
 "Tue, 5 Feb 2019 13:58:03 +0100")
References: <1549371272-5485-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20190205135803.07660a5f@windsurf>
Message-ID: <87ftt2nz6s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> +From 588d4805097d01865538a2d5c52d59c99a1015e7 Mon Sep 17 00:00:00 2001
 >> +From: Matt Weber <matthew.weber@rockwellcollins.com>

 > Please preserve the original authorship. Create a Git branch that
 > starts with the tag we're using in Buildroot, cherry-pick the upstream
 > commit, fix the conflicts and then git format-patch.

And please use git cherry-pick -sx <sha1> to add the original git sha1 and you
signed-off-by to the patch header.

-- 
Bye, Peter Korsgaard
