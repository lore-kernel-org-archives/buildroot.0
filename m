From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Apr 2016 09:39:03 -0300
Subject: [Buildroot] [PATCH] connman: add patch to fix build with
 headers >= 4.5
In-Reply-To: <20160415095606.189893ce@free-electrons.com>
References: <1460643843-26057-1-git-send-email-gustavo@zacarias.com.ar>
 <20160415095606.189893ce@free-electrons.com>
Message-ID: <5710E0E7.5050700@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/16 04:56, Thomas Petazzoni wrote:

> Applied, thanks! I guess it's the same problem as the one affecting
> strongswan, which was recently resolved by disabling iptables support.
> Correct? If you have a better fix for strongswan, feel free to submit
> it.
>
> Thanks!
>
> Thomas

Hi.
Yes, it's very similar in nature, however from strongswan it's not a 
huge show-stopper, whereas for connman you can't build without it.
I'll take a look a strongswan shortly, the solution is probably just 
adapting this patch.
Regards.
