From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 03 Nov 2014 19:31:00 -0300
Subject: [Buildroot] [RFC/PATCH] Makefile: guarantee reproducible
	permissions
In-Reply-To: <54580079.2070603@mind.be>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415018556-28336-2-git-send-email-guido@vanguardiasur.com.ar>
 <54580079.2070603@mind.be>
Message-ID: <54580224.5060708@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/03/2014 07:23 PM, Arnout Vandecappelle wrote:
[..]
> 
>  Also, there are probably a couple of packages that use cp to copy stuff from
> the buildroot directory to the target. A quick search only turns up
> matchbox-keyboard, but there may be more. So perhaps you could do an
> allpackageyes build and see if anything turns up in the target directory that is
> not world-readable. But even without that, the patch is acceptable after just
> fixing the external toolchain and OVERRIDE_SRCDIR support.
> 

Does it make sense to add a few remarks about the rootfs permissions to
the manual as well? That way you won't have to answer people each time
they ask about this, and instead just point to the manual.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
