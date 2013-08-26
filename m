From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 14:04:31 +0200
Subject: [Buildroot] [PATCH] elf2flt: upgrade to latest version
In-Reply-To: <521B3147.3020609@zacarias.com.ar>
References: <1376414751-3447-1-git-send-email-gustavo@zacarias.com.ar>
 <20130826111630.6704aef6@skate> <521B3147.3020609@zacarias.com.ar>
Message-ID: <20130826140431.289306be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 26 Aug 2013 07:43:19 -0300, Gustavo Zacarias wrote:
> On 08/26/2013 06:16 AM, Thomas Petazzoni wrote:
> > Instead of having the source code within Buildroot, can't we fetch it
> > from whatever CVS/Git repository it is available from?
> 
> I guesed there was some historic reason for that.
> Anyway the upstream repository is CVS, we'll need to add host-cvs or
> make the check in dependencies.sh, and add the site method for it.
> What's preferred for this cases? (deps would be better IMHO)

Either we find some Git mirror for it, or yes as you suggest, add a
cvs download method. Just like git/hg and al., it will automatically
integrate with the DL_TOOLS mechanism in
support/dependencies/dependencies.sh.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
