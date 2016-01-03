From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 22:06:12 +0100
Subject: [Buildroot] [PATCH v2] tpm-tools: fix build failures caused by
	-Werror
In-Reply-To: <1451733210-11293-1-git-send-email-noe.rubinstein@gmail.com>
 (=?utf-8?Q?=22No=C3=A9?= Rubinstein"'s message of "Sat, 2 Jan 2016 12:13:30
 +0100")
References: <1451733210-11293-1-git-send-email-noe.rubinstein@gmail.com>
Message-ID: <87lh86mkzf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "No?" == No? Rubinstein <noe.rubinstein@gmail.com> writes:

 > This fixes this build failure (and many others):
 >   http://autobuild.buildroot.org/results/d56/d56bfc69ef0a478219c959d50fb96d526fc2155e/

 > The build failure is caused by the build system using -Werror; this is
 > already patched upstream, so this commit just imports the upstream
 > patch.

 > Signed-off-by: No? Rubinstein <noe.rubinstein@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
