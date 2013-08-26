From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Aug 2013 07:43:19 -0300
Subject: [Buildroot] [PATCH] elf2flt: upgrade to latest version
In-Reply-To: <20130826111630.6704aef6@skate>
References: <1376414751-3447-1-git-send-email-gustavo@zacarias.com.ar>
 <20130826111630.6704aef6@skate>
Message-ID: <521B3147.3020609@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/2013 06:16 AM, Thomas Petazzoni wrote:
> Instead of having the source code within Buildroot, can't we fetch it
> from whatever CVS/Git repository it is available from?

I guesed there was some historic reason for that.
Anyway the upstream repository is CVS, we'll need to add host-cvs or
make the check in dependencies.sh, and add the site method for it.
What's preferred for this cases? (deps would be better IMHO)
Regards.
