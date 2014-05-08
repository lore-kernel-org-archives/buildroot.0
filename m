From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 May 2014 22:01:54 +0200
Subject: [Buildroot] [PATCH v4] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <b6ca647bbdf790bdfdb7.1399295060@argentina> (Thomas De
 Schampheleire's message of "Mon, 05 May 2014 15:04:20 +0200")
References: <b6ca647bbdf790bdfdb7.1399295060@argentina>
Message-ID: <87siokavkd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Add PRE_*_HOOKS to all the different steps through which a package may go.

 > This will help avoid using POST_*_HOOKS to do tasks that should be done
 > in the PRE_*_HOOKS of the next step.
 > Otherwise, when the user would do a make foo-re<step>, this would not do
 > what was really intented, the POST_*_HOOK of the preceding step not
 > being executed.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > [ThomasDS: rebase, add images hooks to manual]
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
