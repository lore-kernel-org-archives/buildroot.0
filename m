From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Apr 2018 16:50:12 +0200
Subject: [Buildroot] [PATCH 1/1] core: enhance printvars for variables
 with newlines
In-Reply-To: <20180403143151.13372-1-chemobejk@gmail.com>
References: <20180403143151.13372-1-chemobejk@gmail.com>
Message-ID: <20180403165012.0d0e173a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Apr 2018 17:31:51 +0300, Stefan Becker wrote:
> If the variable content has newlines in it then the currently dumped
> content can't be fed again to GNU make. Add the option DEFINE_VARS which
> causes the variables to be dumped using
> 
>    define VAR
>    ... line 1 ...
>    ... line 2 ...
>    ...
>    endef
> 
> Updated the manual accordingly.

Just curious, what is the use case for feeding the printvars output
back into GNU Make ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
