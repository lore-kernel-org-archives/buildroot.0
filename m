From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Aug 2013 09:27:23 -0300
Subject: [Buildroot] [PATCH v2] pkg-download: take some more care of
 <PKG_>VERSION with git
In-Reply-To: <20130813121539.58b5e801@skate>
References: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
 <20130813121539.58b5e801@skate>
Message-ID: <520B77AB.2090504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/2013 07:15 AM, Thomas Petazzoni wrote:
> Thomas, Arnout, Gustavo, some thoughts about this patch?
> 
> I'm not a big fan of the fact that <pkg>_VERSION would be optional for
> the git site method, but mandatory for the hg site method, but it's not
> really a strong opinion.

I agree with Arnout.
It MAY make life simpler for some people, but it opens the "moving
target" can of worms.
IF we accept moving targets then policy should be to never use it in a
buildroot release for anything.
Regards.
