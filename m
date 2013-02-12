From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 12 Feb 2013 12:19:32 +0100
Subject: [Buildroot] [PATCH] strongswan: new package
In-Reply-To: <20130208190247.7da881c9@skate>
References: <20130208190247.7da881c9@skate>
Message-ID: <1360667974-9734-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 08 February 2013 19:02:47 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> A few comments (at the top because the patch is big and the comments
> are very general) :
[...] 
>  * Are you sure we need gazillions of configuration options like you
>    had? It seems like you went on by adding one kconfig option for each
>    option the ./configure script provides. This is generally not what
>    we do. Package what you need, possibly with some kconfig options,
>    and then people can progressively extend that with more options as
>    needed.
I confess, I used perl to make it. 

I am not final user of this package. It's difficult to choose which options 
are usefull to present. I tried to do my best in following version.


[...other comments...]

New patch follows.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
