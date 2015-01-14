From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 15:33:58 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.4.11
In-Reply-To: <20150114165731.29a53c1a@free-electrons.com>
References: <1421229527-836-1-git-send-email-gustavo@zacarias.com.ar>
 <20150114165731.29a53c1a@free-electrons.com>
Message-ID: <54B6B696.6050102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/14/2015 12:57 PM, Thomas Petazzoni wrote:

> Since you're looking at squid, could you please look at
> http://patchwork.ozlabs.org/patch/412057/, and maybe resend an updated
> version with the appropriate fixes?

I'll try to cook up something generic, but squid is a complicated beast
to say the least (i.e. can't set runtime user outside the config for
example, store dirs must be pre-initialized and so on).
Regards.
