From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jan 2020 10:42:01 +0100
Subject: [Buildroot] EFI handover support
In-Reply-To: <1579751304890-0.post@n4.nabble.com> (a.'s message of "Wed, 22
 Jan 2020 21:48:24 -0600 (CST)")
References: <1579673443483-0.post@n4.nabble.com>
 <878slzxnt5.fsf@dell.be.48ers.dk> <1579751304890-0.post@n4.nabble.com>
Message-ID: <87muaewlue.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "a" == a  <anushka.parashar@tesco.com> writes:

 > Hi, 
 > I figured that needs to be set, but couldn't find that variable anywhere in
 > the buildroot. 
 > I'm not able to find it, can you please help me with that?

CONFIG_EFI_STUB is a kernel configuration option, not a Buildroot
option. Run `make linux-menuconfig' to change the Linux configuration
options.

-- 
Bye, Peter Korsgaard
