From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Oct 2013 17:08:54 -0300
Subject: [Buildroot] [PATCH] autossh: new package
In-Reply-To: <87fvs3pqml.fsf@dell.be.48ers.dk>
References: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>
 <87fvs3pqml.fsf@dell.be.48ers.dk>
Message-ID: <525C4F56.8010101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2013 05:02 PM, Peter Korsgaard wrote:

> Committed, thanks.
> 
> Have you used it with dropbear? I think I recall some discussion about
> it using openssh specific options. If so, then it should probably depend
> on BR2_PACKAGE_OPENSSH

It can be used with a wrapper script, that's the reason i didn't want to
hardcode openssh into it.
There's also a patch for autossh to allow dropbear-specific options.
I'm unsure which would be preferred to "automagicallize" it for users :)
Regards.
