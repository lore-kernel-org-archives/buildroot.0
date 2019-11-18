From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 13:50:18 +0100
Subject: [Buildroot] [PATCH] package/jailhouse: fix misc details in
 Config.in
In-Reply-To: <20191110132627.15985-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 10 Nov 2019 14:26:26 +0100")
References: <20191110132627.15985-1-thomas.petazzoni@bootlin.com>
Message-ID: <87eey5s60l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit fixes a number of small minor details in the jailhouse
 > Config.in file:

 >  - The Config.in comment is in the middle of the main
 >    BR2_PACKAGE_JAILHOUSE option and its sub-options, causing the
 >    sub-options to not be indented properly in menuconfig

 >  - jailhouse was capitalized as Jailhouse, while all Buildroot
 >    packages in menuconfig use small letters, so use "jailhouse"
 >    everywhere

 >  - no need to repeat "jailhouse" in the prompt of the sub-option for
 >    helper scripts, since it is not properly indented under the main
 >    jailhouse option.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
