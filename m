From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 16:13:34 +0200
Subject: [Buildroot] [PATCH 2/2] package: move busybox show others
	dependency to per-package
In-Reply-To: <1467640016-19732-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 4 Jul 2016 15:46:56 +0200")
References: <1467640016-19732-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1467640016-19732-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874m85fq41.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Having the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS dependencies in
 > package/Config.in is not very practical: it makes this file not very
 > readable, and puts the dependency away from the package itself, which
 > can sometimes be confusing. Therefore, this commit moves the dependency
 > in each package Config.in file.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
