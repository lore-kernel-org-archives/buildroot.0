From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 17:01:28 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: support comments in user
 table files
In-Reply-To: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
References: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
Message-ID: <20151016170128.6a821cd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Yann,

On Fri, 16 Oct 2015 16:50:19 +0200, Peter Korsgaard wrote:
> The format of the users table files is non trivial, so it is sometimes handy
> to add comments explaining the syntax (or simply the reason for the user)
> inline in the files.
> 
> Support comment lines prefixed with '#' similar to shell / makedevs files and strip
> those lines before passing to the mkusers script.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Shouldn't it the responsibility of the mkusers script to ignore such
comments instead ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
