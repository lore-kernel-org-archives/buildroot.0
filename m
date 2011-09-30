From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Sep 2011 17:52:59 -0300
Subject: [Buildroot] [PATCH 2/4] util-linux: disable installing binaries
 by default
In-Reply-To: <20110930222138.2c80696e@skate>
References: <1317412052-28859-1-git-send-email-gustavo@zacarias.com.ar>
 <1317412052-28859-2-git-send-email-gustavo@zacarias.com.ar>
 <20110930222138.2c80696e@skate>
Message-ID: <bc71b5a87456d1eb74d9cdffb40efad9@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Sep 2011 22:21:38 +0200, Thomas Petazzoni wrote:

> I don't see where this new option is being used.
>
>> +define UTIL_LINUX_INSTALL_TARGET_CMDS
>> +	$(UTIL_LINUX_INSTALL_BASIC)
>
> And where this variable is defined.
>
> Thomas

Sleep deprivation wins again, just sent proper v2.
Regards.
