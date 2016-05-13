From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 15:23:14 +0200
Subject: [Buildroot] [PATCH] libinput: remove unneeded patch
In-Reply-To: <20160513075625.GT2419@tarshish>
References: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
 <20160513075625.GT2419@tarshish>
Message-ID: <20160513152314.19eebd42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 10:56:25 +0300, Baruch Siach wrote:
> Hi Peter,
> 
> On Fri, May 13, 2016 at 09:09:52AM +0300, Baruch Siach wrote:
> > The log_msg symbol conflict was fixed in libevdev commit e4c315fc1603 (Rename
> > symbols leaking from static library to avoid name clashes, 2014-08-18) that
> > was included in version 1.3. Remove the patch that used to fix this issue.  
> 
> I meant libevdev version in this last line, since it's a libevdev commit. 
> We're at 1.4.6 on that.

You're already saying "libevdev" in your commit log. But the fact that
you're removing a patch from libinput is not clear. I guess it's
because libinput links against libevdev, but this should be made
clearer in your commit message.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
