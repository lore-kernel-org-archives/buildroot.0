From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:07:44 +0200
Subject: [Buildroot] [git commit] gdb: drop duplicate dependencies
In-Reply-To: <20180630200135.47448838B4@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 30 Jun 2018 22:02:38 +0200")
References: <20180630200135.47448838B4@busybox.osuosl.org>
Message-ID: <87pnzjedxr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f50578ab98bbc99139838375f6221411d420b298
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 1e3738db42919cb4487f7a64381ac7d3090d0e1f ("package/gdb: rework
 > dependency for C++11") erroneously added duplicate dependencies in
 > package/gdb/Config.in related to gcc 4.8 and C++ dependency.

 > One copy of those dependencies was below the select causing a
 > check-package warning.

 > Fixes:

 > package/gdb/Config.in:28: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
