From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:09:11 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
	security bump version to 1.19.5
In-Reply-To: <20171015134948.C8DBD7FA3A@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 15 Oct 2017 15:56:59 +0200")
References: <20171015134948.C8DBD7FA3A@busybox.osuosl.org>
Message-ID: <87376ii1jc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e7713abf89f3fa3ab773813a10b61080471f5bcb
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes

 > xfixes: unvalidated lengths (CVE-2017-12183)

 > Xi: fix wrong extra length check in ProcXIChangeHierarchy
 >  (CVE-2017-12178)

 > dbe: Unvalidated variable-length request in ProcDbeGetVisualInfo
 >  (CVE-2017-12177)

 > Unvalidated extra length in ProcEstablishConnection (CVE-2017-12176)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
