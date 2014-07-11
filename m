From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Jul 2014 06:59:18 -0300
Subject: [Buildroot] [PATCH 10/10] busybox: support only one version
In-Reply-To: <20140711093004.2c1f891c@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87oawxntvt.fsf@dell.be.48ers.dk>
 <20140710171848.75381ecb@free-electrons.com> <20140710155650.GA28300@free.fr>
 <87y4w1m2jo.fsf@dell.be.48ers.dk>
 <20140711093004.2c1f891c@free-electrons.com>
Message-ID: <53BFB576.3020001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/2014 04:30 AM, Thomas Petazzoni wrote:

> We could also switch to use some Config.in comment to say that "bash
> could be available if Busybox show others was enabled" or something
> like that. But that would add a lot of comment and clutter menuconfig
> quite a bit.

bool "bash - more complete version that busybox ash!"
But it's ugly!
Colored entries would be great for this.
Regards.
