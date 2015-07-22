From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 11:47:34 -0300
Subject: [Buildroot] [PATCH] netperf: bump to version 2.7.0
In-Reply-To: <20150722164558.202319a6@free-electrons.com>
References: <1437573590-11966-1-git-send-email-gustavo@zacarias.com.ar>
 <20150722164558.202319a6@free-electrons.com>
Message-ID: <55AFAD06.90907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/07/15 11:45, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
>
> On Wed, 22 Jul 2015 10:59:50 -0300, Gustavo Zacarias wrote:
>> Also add hash file.
>> And work around gcc 5+ defaulting to gnu99, fixes:
>
> gnu99
>
>> +	CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
>
> or gnu89 ? :-)

The default in gcc < 5 is gnu89, in gcc >= 5 is gnu99, and netperf needs 
gnu89, so the text and cflags are fine ;)
Regards.
