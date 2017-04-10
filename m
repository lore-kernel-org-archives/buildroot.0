From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 13:45:49 +0200
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <33dd1db4-d5cb-3f49-931d-613dd6967b7d@sensefly.com>
References: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
 <20170406223644.473ebd65@free-electrons.com>
 <cd88fd7c-dceb-cef1-59de-e086c6b3df00@sensefly.com>
 <d0b4e258-3c24-2691-3d93-03c4f1a936e8@gmail.com>
 <33dd1db4-d5cb-3f49-931d-613dd6967b7d@sensefly.com>
Message-ID: <20170410134549.6da2679d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your new iteration of the libgphoto2 patch!

On Mon, 10 Apr 2017 11:24:32 +0200, Kevin JOLY wrote:

> > Also, can you check this new package with the new test-pkg script ? [3]
> > (17.20.2. How to test your package).  
> I ran the test. Everything was OK except br-arm-cortex-m4-full and 
> br-arm-full-nothread.

What errors did you had with those toolchains? Did you fix those issue
in your v2?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
