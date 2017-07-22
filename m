From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Jul 2017 20:05:37 +0200
Subject: [Buildroot] img layout
In-Reply-To: <trinity-ffd74dfb-bbcb-4388-b167-3751c575d063-1500739094038@3capp-mailcom-bs02>
 (daggs@gmx.com's message of "Sat, 22 Jul 2017 17:58:14 +0200")
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
 <20170721092626.57bf9db2@windsurf>
 <trinity-6a261bc1-46e9-4b2a-9e53-ec32e5d148b0-1500628795781@3capp-mailcom-bs09>
 <20170721114653.16e88cb7@windsurf>
 <trinity-3f5802c7-1ac0-4e24-99dd-7277897cbbf3-1500634651202@3capp-mailcom-bs02>
 <trinity-ffd74dfb-bbcb-4388-b167-3751c575d063-1500739094038@3capp-mailcom-bs02>
Message-ID: <87eft8pcsu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "daggs" == daggs  <daggs@gmx.com> writes:

Hi,

 >> > Use genimage, you can specify at which offset which image should be
 >> > placed. See board/engicam/icorem6/genimage.cfg for example.

 >> interesting, I'll look into it, thanks.

 > I wonder, does setting offset to 0 will write a file to the start of the image?

I guess not, as the very first sector is used for the master boot record
/ partition table.

I think it would be safer/better to leave the manual dd invocations on
the outout of genimage.

-- 
Bye, Peter Korsgaard
