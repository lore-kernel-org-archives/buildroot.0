From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Apr 2013 23:40:02 +0200
Subject: [Buildroot] [pull request v9] Pull request for branch
	yem-package-create-user
In-Reply-To: <cover.1365786584.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 12 Apr 2013 19:14:17 +0200")
References: <cover.1365786584.git.yann.morin.1998@free.fr>
Message-ID: <87sj2e8f2l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!
 Yann> Here is a series that allows packages to create users.

 Yann> Packages that install daemons may well want to run those daemons as
 Yann> non-root users to avoid security issues. Currently, there are two users
 Yann> of choice to run 'generic' daemons: root or daemon (although there are
 Yann> a few dedicated users to run a few services: mail, sshd, ftp...).

 Yann> This series builds upon both the package infrastrucutre to define the
 Yann> user(s) a package may want to create, and the filesystem infrastructure
 Yann> to actually generate these users, and chown their ${HOME}s.

 Yann> Documentation is updated accordingly.

 Yann> As a proof of concept, the package tvheadend has been updated to use
 Yann> a dedicated user to run its daemon as (call me stubborn! ;-] ).

Committed series, thanks!

-- 
Bye, Peter Korsgaard
