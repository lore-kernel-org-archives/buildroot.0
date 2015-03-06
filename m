From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 11:30:29 -0300
Subject: [Buildroot] [PATCH] cups: deprecate package due to security
	issues
In-Reply-To: <20150306150950.0fbaa59e@free-electrons.com>
References: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
 <20150306150950.0fbaa59e@free-electrons.com>
Message-ID: <54F9BA05.9050702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 11:09 AM, Thomas Petazzoni wrote:
> Any reason why this is done on the comment only, and not on the package
> itself?
> 
> Other than that, I'd personally be in favor of this deprecation.
> Hopefully it will encourage someone to step up and upgrade cups.

I just used it as a mark for when/if removing it, since they all depend
on BR2_PACKAGE_CUPS being selected, not needed really.
Ideally something like BR2_LEGACY would be best for the users to get a
big warning, problem is that introducing it for just one package isn't
very useful, and it would set a precedent for other packages to lag
behind as well.
Regards.
