From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:09:31 +0200
Subject: [Buildroot] [PATCH 3/6] mosquitto: disable with broken NIOS 2
	toolchains
In-Reply-To: <1431714233-24324-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 15 May 2015 20:23:50 +0200")
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431714233-24324-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r3qgbrec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > mosquitto triggers the infamous _gp issue with the NIOS 2 toolchains,
 > so let's not allow mosquitto in such situations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/b853369452115b0c6f32c6c960af2dbdf71a74af/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
