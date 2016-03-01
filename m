From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 23:11:10 +0100
Subject: [Buildroot] Rework musl fix patches
In-Reply-To: <3behqcxu66.ln2@ID-313208.user.individual.net>
References: <20160221235940.0b4d71ec@free-electrons.com>
 <20160301104002.00d32dcb@free-electrons.com>
 <3behqcxu66.ln2@ID-313208.user.individual.net>
Message-ID: <20160301231110.4d16de1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Tue, 01 Mar 2016 22:31:47 +0100, Bernd Kuhls wrote:

> the merge of the next branch to master will keep me busy rebasing the 
> rest of the Kodi series, I also have a lot of libs from x11 to add to 
> _DEPENDENCIES for quite a few packages. After that I will return to the 
> musl area, I lowered my priority for it because the number of autobuild 
> errors dropped ;) If someone wants to improve a patch of mine, regardless 
> whether musl-related or not, to fix an autobuild error for example, 
> everybody is free to bring it into a state where you will accept it, I 
> won't mind ;)

OK, thanks a lot for your input. Maybe we should start a Wiki page or
add bug tracker entries to track the remaining musl issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
