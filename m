From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:21:08 +0200
Subject: [Buildroot] [PATCHv3 07/20] dependencies: remove useless targets
In-Reply-To: <1381256237-27948-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:04 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871u3u4m2j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The dependencies-source, dependencies-clean and dependencies-dirclean
 Thomas> targets are not needed, as long as 'dependencies' is not used in the
 Thomas> <pkg>_DEPENDENCIES of a package.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
