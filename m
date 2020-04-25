From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:11:02 +0200
Subject: [Buildroot] [git commit] package/python-flask: fix runtime
 python modules dependencies
In-Reply-To: <20200324210405.7BAF58817D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 24 Mar 2020 22:16:44 +0100")
References: <20200324210405.7BAF58817D@busybox.osuosl.org>
Message-ID: <87v9lot4zd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6576d26024f40647a15633b52a2a27c5779801e5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > - add python setuptools runtime dependency, fixes:
 >   ModuleNotFoundError: No module named 'pkg_resources'

 > - add python libxml2 runtime dependency, fixes:
 >   ModuleNotFoundError: No module named 'xml'

 > - add python ssl runtime dependency, fixes:
 >   AttributeError: 'NoneType' object has no attribute 'SSLContext'

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
