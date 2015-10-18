From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:57:13 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: support comments in user
 table files
In-Reply-To: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
References: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
Message-ID: <20151018175713.492ba9b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, 16 Oct 2015 16:50:19 +0200, Peter Korsgaard wrote:
> The format of the users table files is non trivial, so it is sometimes handy
> to add comments explaining the syntax (or simply the reason for the user)
> inline in the files.
> 
> Support comment lines prefixed with '#' similar to shell / makedevs files and strip
> those lines before passing to the mkusers script.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Yann has added support in mkusers to ignore comments, so I applied
Yann's patch and marked yours as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
