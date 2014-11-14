From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 19:25:13 -0300
Subject: [Buildroot] [PATCH 04/10] ifupdown: new package
In-Reply-To: <54667AA1.7010109@mind.be>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-5-git-send-email-gustavo@zacarias.com.ar>
 <54667AA1.7010109@mind.be>
Message-ID: <54668149.5040909@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/2014 06:56 PM, Arnout Vandecappelle wrote:

>  Why not 'make BASEDIR=$(TARGET_DIR) install'?

I'll switch it, forgot to clean that up once all the bits were working.

>  Nice to see that the _INIT_SYSTEMD macro really needs to do something more than
> copying a unit file!

Actually i think we might want to do something like that for SysV since
at the moment we handle those in the initscripts, one big S02tmpfiles or
similar that gets "compiled" by buildroot according to package needs
might be nice - pretty low priority though :)
Regards.
