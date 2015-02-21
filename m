From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Feb 2015 11:59:54 -0300
Subject: [Buildroot] [PATCH] iodine: new package
In-Reply-To: <20150221155626.4f3d4b2c@free-electrons.com>
References: <1424522729-22692-1-git-send-email-gustavo@zacarias.com.ar>
 <20150221155626.4f3d4b2c@free-electrons.com>
Message-ID: <54E89D6A.9050804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/2015 11:56 AM, Thomas Petazzoni wrote:

>> +define IODINE_BUILD_CMDS
>> +	$(MAKE) CC="$(TARGET_CC)" ARCH=$(BR2_ARCH) -C $(@D)
> 
> Is passing ARCH actually needed? I see ARCH being defined as `uname -m`
> in src/Makefile, but it doesn't seem to be used anywhere.
> 
> If it's actually used, are we sure that the values of $(BR2_ARCH) match
> what iodine expect as ARCH values?
> 
> Thanks!

It's not really required, just to cover for the cosmetic/paranoid type ;)
Regards.
