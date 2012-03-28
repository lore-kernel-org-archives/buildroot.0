From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 17:32:22 -0300
Subject: [Buildroot] [PATCH] openswan: new package
In-Reply-To: <201203282204.30908.arnout@mind.be>
References: <1332889779-27193-1-git-send-email-gustavo@zacarias.com.ar>
 <201203282204.30908.arnout@mind.be>
Message-ID: <cc44511606180b21f748baa2d517feb5@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-28 17:04, Arnout Vandecappelle wrote:

> On Wednesday 28 March 2012 01:09:39 Gustavo Zacarias wrote:
>> +OPENSWAN_MAKEOPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
>
>  Could you name this variable OPENSWAN_MAKE_OPT?  If we ever get a
> MAKETARGETS infrastructure, that's what the variable will be called.
>
>  Regards,
>  Arnout

Sure, respun into V2, thanks.
Regards.
