From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 12:15:39 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: take some more care of
 <PKG_>VERSION with git
In-Reply-To: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
References: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
Message-ID: <20130813121539.58b5e801@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Apr 2013 21:40:08 +0200, Patrick Boettcher wrote:
> This replaces the one-liner patch I made last week after a comment by
> Thomas De Schampheleire. (it is now a 5-liner)
> 
> I added comment to explain why using HEAD is better in the current
> situation. I did not change the hg-part as it is different to git -
> after a quick read it won't work at all when VERSION is not set in a
> packge.
> 
> Please apply if appropriate and helpful (it is for me).
> 
> Patrick Boettcher (1):
>   pkg-download: take some more care of <PKG_>VERSION when METHOD is git
> 
>  package/pkg-download.mk |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Thomas, Arnout, Gustavo, some thoughts about this patch?

I'm not a big fan of the fact that <pkg>_VERSION would be optional for
the git site method, but mandatory for the hg site method, but it's not
really a strong opinion.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
