From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 10:26:42 +0200
Subject: [Buildroot] [PATCH] autossh: new package
In-Reply-To: <87iowzoanz.fsf@dell.be.48ers.dk>
References: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>
 <87fvs3pqml.fsf@dell.be.48ers.dk>
 <525C4F56.8010101@zacarias.com.ar>
 <87iowzoanz.fsf@dell.be.48ers.dk>
Message-ID: <20131015102642.5f579a88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 14 Oct 2013 22:33:04 +0200, Peter Korsgaard wrote:
> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
> Hi,
> 
>  Gustavo> It can be used with a wrapper script, that's the reason i
>  Gustavo> didn't want to hardcode openssh into it.  There's also a patch
>  Gustavo> for autossh to allow dropbear-specific options.  I'm unsure
>  Gustavo> which would be preferred to "automagicallize" it for users :)
> 
> I'm also not quite sure what would be the best way. Anybody else?

At least mention that in package help text (that, IIUC, it normally
depends on OpenSSH, but there are patches or other ways to make it work
with Dropbear, possibly giving pointers to those patches).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
