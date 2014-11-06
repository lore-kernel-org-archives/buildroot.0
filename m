From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 14:25:43 -0300
Subject: [Buildroot] [PATCH 2/7] package/uclibc: enable wordexp
In-Reply-To: <20141106182251.1c12ea40@free-electrons.com>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>	<1415281013-1077-3-git-send-email-gustavo@zacarias.com.ar>
 <20141106182251.1c12ea40@free-electrons.com>
Message-ID: <545BAF17.2090009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 02:22 PM, Thomas Petazzoni wrote:

> Does Debian ifupdown fails to build? If it does, then we'll have
> zillions of build failures with all the prebuilt uClibc toolchains that
> don't have wordexp enabled :/

Yes, that's true.
The series is RFC, i can add an exception for external toolchains, or
alternatively just disable this for uClibc in general - after all
enabling all the big versions is bloaty enough.
Regards.
