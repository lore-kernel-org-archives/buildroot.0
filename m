From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 22:45:42 +0100
Subject: [Buildroot] [PATCHv3 09/74] portmap: improve installation of
	binaries
In-Reply-To: <1417357142-14307-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:17:57 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppc3doxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit explicits the permissions with which executables are
 > installed, and also makes sure that the build is aborted is one of the
 > binary cannot be installed, instead of silently ignoring the error.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the typoes fixed, thanks.

-- 
Bye, Peter Korsgaard
