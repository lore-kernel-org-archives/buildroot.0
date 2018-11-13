From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:55:53 +0100
Subject: [Buildroot] [git commit] mysql: properly order "depends on" vs.
 bool
In-Reply-To: <20181026192745.48A868283C@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 26 Oct 2018 21:28:31 +0200")
References: <20181026192745.48A868283C@busybox.osuosl.org>
Message-ID: <87ftw4y4cm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=cbf62fc5692cc04a2f721260d5e7f8a2558b4bb1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This fixes a check-package warning introduced by commit
 > 19df27ed03b33cd86c971afb355091161972851f ("package/mariadb: add option
 > to disable build of embedded server")

 > Fixes:

 > package/mysql/Config.in:59: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
