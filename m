From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 03 Jan 2013 07:47:23 -0300
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <20130103114252.18661c1e@skate>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
 <50E48268.401@zacarias.com.ar> <20130102200144.5ed56106@skate>
 <50E4875F.6090305@zacarias.com.ar> <20130103114252.18661c1e@skate>
Message-ID: <50E561BB.9060102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/2013 07:42 AM, Thomas Petazzoni wrote:

> Since you were replying to a patch removing a X.org driver because the
> driver has been removed from X.org releases, I thought your SiS driver
> was in this case, but it's not.
> 
> So, your point was that beyond the driver I removed, a bunch of others
> could be removed, because even though X.org still has those drivers in
> their releases, the hardware is so ancient that it doesn't make sense
> to keep the drivers?

Yes, that exactly.
Regards.
