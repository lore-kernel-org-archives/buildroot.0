From: Nick Peirson <nick@netcentral.co.uk>
Date: Fri, 31 Oct 2008 15:26:43 +0000
Subject: [Buildroot] Patch review
In-Reply-To: <490AE48B.20306@netcentral.co.uk>
References: <490AD4EF.1010106@netcentral.co.uk> <20081031104315.GJ26468@mx.loc>
	<490AE48B.20306@netcentral.co.uk>
Message-ID: <490B23B3.60801@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nick Peirson wrote:
> Bernhard Reutner-Fischer wrote:
>> Did you send the non-makefile patch upstream? If you didn't already then
>> please do now..
> 
> I wasn't sure if the bug was related to buildroot/uclibc, which I
> mentioned in the bug notes, but I'll send it upstream and see what's
> made of it.
> 

Posted the patch on the syslinux list, but apparently there's already a 
fix upstream of syslinux.

Can the patch I attached be applied to the buildroot svn? Currently the 
syslinux.mk points to a version of syslinux that isn't available and 
will break the build.

I can create a patch to move to 3.63 if that's preferred, as there 
aren't as many changes, although going to 3.72 seems preferable to me?

-- 
Regards

Nick Peirson

--
Internet Central Ltd is a limited company registered in England. 
Registered number: 3079542. Registered office: Ivy House Foundry, 
Hanley, Stoke-on-Trent ST1 3NR.

This message is private and confidential. If you have received this 
message in error, please notify us and remove it from your system.
