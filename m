From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jul 2015 18:14:06 -0300
Subject: [Buildroot] [PATCH] gcc: add gcc 5.2.0
In-Reply-To: <20150716231024.656693cb@free-electrons.com>
References: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>	<20150716225639.14772165@free-electrons.com>	<55A81B35.2040200@zacarias.com.ar>
 <20150716231024.656693cb@free-electrons.com>
Message-ID: <55A81E9E.8000103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/07/15 18:10, Thomas Petazzoni wrote:

> Gah, not the sort of thing you would expect from a bug fix release :-/
>
>> Do we still want to step on 5.1 considering this?
>
> Then I'm not sure obviously. I see two options here:
>
>   * Switch to the policy where we support only one 5.x version at a time
>     (option named BR2_GCC_VERSION_5_X), and keep 5.1 for now until 5.3
>     is released, hopefully fixing the major bugs.
>
>   * Package gcc 5.2 separately from 5.1. But it's pretty useless to
>     offer as a package a compiler that is not even capable of building a
>     kernel that boots.
>
> Opinions?

I was going to go for what you've said until i saw the size delta and 
issue, and opted for this approach, but i'm open to votes/suggestions as 
well.
Maybe skipping 5.2.0 for the time?
Regards.
