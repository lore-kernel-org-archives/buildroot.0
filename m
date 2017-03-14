From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:01:45 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.2
In-Reply-To: <20170314150039.9913-1-peter@korsgaard.com>
References: <20170314150039.9913-1-peter@korsgaard.com>
Message-ID: <20170314220145.664560df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 16:00:39 +0100, Peter Korsgaard wrote:
> Fixes CWE-416 (use after free condition during netjoin processing). No CVE
> assigned yet:
> 
> https://irssi.org/security/irssi_sa_2017_03.txt
> 
> Notice that the 0.8.x series is not believed to be vulnerable to this
> specific issue. From the advisory:
> 
> Affected versions
> -----------------
> 
> Irssi up to and including 1.0.1
> 
> We believe Irssi 0.8.21 and prior are not affected since a different
> code path causes the netjoins to be flushed prior to reaching the use
> after free condition.

So why do you have "security bump" in the commit title ? We're using
0.8.21, which is not affected by the issue, so this is not a security
bump IMO, unless I missed something.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
