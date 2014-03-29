From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:00:38 +0100
Subject: [Buildroot] rsync fails to build
In-Reply-To: <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
 <20140329143057.6e6aa65a@skate>
 <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
Message-ID: <20140329180038.7acf5143@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sat, 29 Mar 2014 17:39:20 +0100, Sagaert Johan wrote:

> It contains some suspected lines :
> (I am using gcc 4.6.x)
> 
> checking attr/xattr.h usability... yes
> checking attr/xattr.h presence... no
> configure.sh: WARNING: attr/xattr.h: accepted by the compiler, rejected by the preprocessor!
> configure.sh: WARNING: attr/xattr.h: proceeding with the compiler's result
> checking for attr/xattr.h... Yes
> 
> My older (working)build does not have these warnings, but the attr package is selected due to the udev selection and udev extras.
> 
> (Did you build with the packages attr and acl disabled ?)

I had acl and attr disabled, but I tried again with them enabled, and
it still works.

> I will do a build using gcc 4.8.x to see if this warning still exists.

I don't think it's going to change anything. Can you do a complete
"make clean all" cycle to verify that the error still exists? If it
does, can you please post on http://code.bulix.org the contents of
rsync config.log file, as well as the complete build output of the
rsync package, from its extraction step?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
