From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 21:19:10 +0200
Subject: [Buildroot] Problems building iotop
In-Reply-To: <CA+12NBL_ABjQZETEs4xUVZf8kcCW4+Qm1KEafXxbZi7o1VzK1g@mail.gmail.com>
References: <CA+12NB+dzKMw2x=mBESq+Ti0COMiQmbHTiRaO=E35xOZch+4gw@mail.gmail.com>
 <20170511174933.28030e0a@free-electrons.com>
 <CA+12NBKcGynVqiynZvETmSQEdLr138tM9s8n32RpwDgE1w7ABg@mail.gmail.com>
 <20170512161308.1881fcb5@free-electrons.com>
 <CA+12NBL_ABjQZETEs4xUVZf8kcCW4+Qm1KEafXxbZi7o1VzK1g@mail.gmail.com>
Message-ID: <20170512211910.4919fb79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 13:31:57 -0400, Linux User wrote:

> I do understand that. But for 1 package, I dont want to upgrade to entire
> BR. What I am trying to do should be possible. Isn't it ? If you can give
> me some pointers, I dont mind, working on it.

Well, you can certainly backport the package. But beware that a simple
copy of package/iotop/ will most likely not work. Indeed between a
Buildroot of ~2013 (that you are using) and a Buildroot of 2015 (which
has iotop), we most likely made some changes in the package
infrastructure. So you will have to re-adapt iotop.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
