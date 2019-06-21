From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Jun 2019 11:46:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.2.11
 and add gzip fix
In-Reply-To: <20190620182345.61c30d6a@windsurf> (Thomas Petazzoni's message of
 "Thu, 20 Jun 2019 18:23:45 +0200")
References: <b2b6ccb8327f40de1bdaaf1e07b11183af5f6e92.1560836325.git.sbobroff@linux.ibm.com>
 <20190620182345.61c30d6a@windsurf>
Message-ID: <871rznfezo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > This patch is not properly formatted: it is not formatted with "git
 > format-patch". In addition, putting a comment before the patch (even if
 > it's formatted with git format-patch) makes it impossible to apply the
 > patch with "git am".

 > The canonical way of generating such patch is:

 > 	git cherry-pick -x 3676fc318a458f71df76620a7e66f5c5807cf9b1
 > 	add your Signed-off-by in the commit log + any comment

NIT: git cherry-pick also understands the -s option to add
signed-off-by, so you can use:

git cherry-pick -sx <commit>

And then just git commit --amend to add any needed comments to the
commit message.

-- 
Bye, Peter Korsgaard
