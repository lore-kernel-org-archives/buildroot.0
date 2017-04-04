From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Apr 2017 23:48:51 +0200
Subject: [Buildroot] [PATCH 1/1] libselinux: query for python
	site-packages dir directly
In-Reply-To: <1491271571-21770-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 3 Apr 2017 21:06:11 -0500")
References: <1491271571-21770-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87fuhnu9mk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > With the bump to version 2.6, the following commit needs
 > to be taken into consideration for overloading paths.
 > https://github.com/SELinuxProject/selinux/commit/8162f10e670da963eb65ccf1e7de69ea85aba30d

 > The PYLIBVER is no longer used and the PYTHONLIBDIR is
 > renamed to PYSITEDIR with slightly different pathing.

 > More details can be found in the issue ticket which was
 > marked as a non-issue after analysis that a Buildroot fix
 > was the resolution.
 > https://github.com/SELinuxProject/selinux/issues/51

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
