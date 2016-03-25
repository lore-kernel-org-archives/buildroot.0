From: g4 at novadsp.com <g4@novadsp.com>
Date: Fri, 25 Mar 2016 10:53:04 -0000
Subject: [Buildroot] Bootchart: Submit a patch questions ...
In-Reply-To: <20160324221509.28f24024@free-electrons.com>
References: <003001d185dd$c7fa6ec0$57ef4c40$@novadsp.com>
 <20160324221509.28f24024@free-electrons.com>
Message-ID: <033e01d18684$822e9130$868bb390$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

> > 4. Finally locally BR is configured to get its kernel sources and
> > .config from a local clone of /linux on github. In such a case can BR
> > actually correctly check the dependencies for bootchart? Presumably it
> > does test kernel config settings against the local .config stashed in
build?
> 
> I am not sure to fully understand the question, but if I understand
correctly,
> you're saying that bootchart requires some specific kernel configuration
> options. If that's what you mean, then there are two
> cases:
> 
>  * If the kernel option is needed for bootchart to actually *build*,
>    then you should modify linux/linux.mk to make sure the relevant
>    kernel configurations are enabled when bootchart is enabled.
> 
>  * If the kernel option is only needed for bootchart to work at
>    runtime, then we generally just recommend to indicate which kernel
>    options are needed in the help text of bootchart's Config.in file.

Ideal

> Hope this helps,
> 
> Thomas

It most certainly does. Thanks. I'll tidy things up as per recommendations .

Jerry
