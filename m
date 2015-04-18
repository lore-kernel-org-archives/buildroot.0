From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Apr 2015 18:05:35 -0300
Subject: [Buildroot] [PATCH 1/2] uclibc: unbreak SH & SPARC
In-Reply-To: <20150418153650.59685220@free-electrons.com>
References: <1429217745-3205-1-git-send-email-gustavo@zacarias.com.ar>
 <20150418153650.59685220@free-electrons.com>
Message-ID: <5532C71F.7090904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/18/2015 10:36 AM, Thomas Petazzoni wrote:

> Applied, thanks.
> 
> Waldemar, is this patch also needed for uClibc-ng ?

1.0.1 didn't have the offending patch applied, and 1.0.2 already
includes it, so no need to touch anything for -ng.
Regards.
