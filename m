From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:57:21 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: add patch to fix readline
 issue
In-Reply-To: <20180420140713.16271-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 20 Apr 2018 16:07:13 +0200")
References: <20180420140713.16271-1-thomas.petazzoni@bootlin.com>
Message-ID: <87fu3biza6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since bluez5_utils 5.49, some code using readline was compiled even if
 > readline was not available. After this issue was reported upstream, a
 > patch was proposed by an upstream developer to address the issue. This
 > commit integrates this patch (under review upstream), which fixes the
 > problem.

 > Fixes:

 >   http://autobuild.buildroot.net/results/3e266a79acab8b8eb33360f7afbc1cd6db46f7cb/

We also have this problem on 2018.02.x which uses bluez5_utils 5.48.1
(and had it with 5.48 as well), so this applies since 5.49.

Committed to 2018.02.x with the version number refernce fixed, thanks.

-- 
Bye, Peter Korsgaard
