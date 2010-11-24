From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Nov 2010 11:15:45 -0300
Subject: [Buildroot] [pull request] Pull request for branch for-2010.11
In-Reply-To: <20101123203028.6875317e@surf>
References: <4CEC039F.8020909@zacarias.com.ar> <20101123203028.6875317e@surf>
Message-ID: <4CED1E11.9070704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/23/10 16:30, Thomas Petazzoni wrote:

> Could you try to post the patches themselves ?
> 
> In "squid: bump to version 3.1.9", I don't agree with:
> 
>   SQUID_MAKE_OPT = CXX_FOR_BUILD=g++
> 
> CXX_FOR_BUILD is already passed in $(TARGET_CONFIGURE_OPTS), so this
> shouldn't be necessary. And if it really is, then $(HOSTCXX) should be
> used instead.
> 
> The rest looks ok to me.
> 
> Thomas

Sure thing, resent as v2.
Ditched it, no longer required, was a leftover.
Regards.
