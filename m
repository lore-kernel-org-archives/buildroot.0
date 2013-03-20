From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Mar 2013 23:28:50 +0100
Subject: [Buildroot] [PATCH] xinetd: follow the convention for patch
	location
In-Reply-To: <1363814178-24310-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 20 Mar 2013 22:16:17 +0100")
References: <1363814178-24310-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjxxpuxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Following 5538e4766201aa0 ("rework patch model"), the xinetd patches
 Thomas> were no longer being applied, because they were stored in
 Thomas> package/xinetd/xinetd-2.3.15/*.patch. This lead to xinetd build
 Thomas> failures such as:
 Thomas> http://autobuild.buildroot.org/results/1a032bca894b76facd9e7f01c3b5d370987d7fc8/build-end.log.

 Thomas> This patch fixes this by changing the location and name of the xinetd
 Thomas> patches to follow the new conventions.

Committed, thanks.

-- 
Bye, Peter Korsgaard
