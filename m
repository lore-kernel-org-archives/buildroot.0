From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 10:36:15 +0200
Subject: [Buildroot] [PATCH 1/2] boot: add s500-bootloader package
In-Reply-To: <1464010429-3604-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Mon, 23 May 2016 15:33:48 +0200")
References: <1464010429-3604-1-git-send-email-peter@korsgaard.com>
Message-ID: <87k2ih6wsg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This is the first level bootloader for the Actions Semiconductor S500 SoC,
 > which is used on boards like Roseapple Pi and LeMaker Guitar.

 > The bootloader performs basic configuration and chain loads u-boot for
 > futher setup.

 > This bootloader is unfortunately only available as a binary blob. It gets
 > configured for a specific board using a binary (32bit x86) tool based on a
 > .ini file (somewhat similar to sunxi .fex).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to next, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
