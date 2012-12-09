From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:56:03 +0100
Subject: [Buildroot] [PATCH 5/8] bmon: needs MMU for fork()
In-Reply-To: <d3711ead28655ab34fded4452b0410dd13c192b1.1355076808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Dec 2012 19:14:00 +0100")
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <d3711ead28655ab34fded4452b0410dd13c192b1.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87624bvtb0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes:
 Thomas>   http://autobuild.buildroot.org/results/673b0e9a1ba75123ba2c59df8ad81550170fffef/build-end.log

Gustavo already sent a similar patch for this, so I dropped this one.

-- 
Bye, Peter Korsgaard
