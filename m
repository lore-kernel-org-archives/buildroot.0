From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Sep 2012 08:37:31 -0300
Subject: [Buildroot] [PATCH] jimsh: new package
In-Reply-To: <50483D77.40902@mind.be>
References: <1346778052-31923-1-git-send-email-gustavo@zacarias.com.ar>
 <50483D77.40902@mind.be>
Message-ID: <50488AFB.9020205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/12 03:06, Arnout Vandecappelle wrote:

>  I guess a patch that installs usb_modeswitch's tcl script will follow
> then?
> 
>  You'll probably want to add a hidden BR2_NEEDS_TCLSH which selects
> JIMSH if TCL is not defined.  And/or a HAS_TCLSH that is selected by
> jimsh and tcl.  Or should those symbols only be introduced when a
> package actually selects or depends on them?

I'm on the HAS_TCLSH side since there aren't many tclsh-using packages
at the moment, and there may be some (sick) valid reason for both with
jimsh not being as complete as full Tcl.
But that's for another patch when (if) jimsh gets in, it's not the first
iteration, there was one last year that went by silently :)
Regards.
