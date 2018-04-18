From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 16:50:09 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: added missing dependency
In-Reply-To: <1524062033-24852-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1524062033-24852-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180418165009.038d822f@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 16:33:53 +0200, Guillaume W. Bres wrote:
> Fixes 
> 	
> 	http://autobuild.buildroot.net/results/0c8d0eeb693ac29739845f489caffc2f9fa3b262/
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Thanks, I'll apply. Just a few more comments for future
contributions, as suggestions to improve them:

 - Don't use the past tense in the commit log. Your commit has not
   "added" something, but it's *adding* something. So please always use
   forms like "add missing dependency", "remove this", "change that",
   and not a past tense.

 - The commit title could be more specific: "add missing dependency on
   threads"

 - When you send a second iteration of a patch, please generate it with
   "git format-patch -v2", which will change the patch prefix to:

     [PATCH v2]

   And also include a changelog of what changed since the previous
   iteration under the "---" that is below the Signed-off-by line. This
   helps people reviewing your patches understand what were the changes
   between each iteration. For a simple patch like this one, this is
   not a big deal of course, but I thought I should mention this best
   practice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
