From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:22:22 +0200
Subject: [Buildroot] [PATCH v2] fs/common: allow custom user table to
 override package-defined users
In-Reply-To: <1538521340-25386-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 2 Oct 2018 18:02:20 -0500")
References: <1538521340-25386-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87k1m7a60x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Currently, when a custom user table and a package define the same user,
 > the settings from the package takes precedence over the ones from the
 > custom user table.

 > However, it makes sense to allow the settings from the custom user table
 > take precedence. For example, it would allow redirecting the user's
 > home directory to an alternate location (e.g. away from tmp and into a
 > partition that is persistent).

 > The support/scripts/mkusers script will only retain settings from the
 > latest definition it finds.

 > Thus, by passing the custom user table after the package defined users,
 > it is possible to override the package provided user definitions.

 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Change v1 -> v2
 > [Yann
 >  - Updated commit message

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
