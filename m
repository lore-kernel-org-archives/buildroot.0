From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 17 Jan 2013 11:23:17 +0100
Subject: [Buildroot] [PATCH v0] Add support for automated building of
	Opkg repository
In-Reply-To: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
References: <1358268430-2431-1-git-send-email-jezz@sysmic.org>
Message-ID: <1423867.kLX9PqGxu5@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 15 January 2013 17:47:07 J?r?me Pouiller wrote:
> Dear,
> 
> I wrote a first draft of support of building deb or ipk file in Buildroot.
> The result looks like this:
>   http://sysmic.org/~jezz/ipk_repository
> 
> This patch use inotify to spy which file are installed by package. Once
> installation is done, it copy file to a temporary directory where ipk file
> is built.
[...]
> Result is not so bad, as you can see on URL above and it is not intrusive. I
> would be glad to get your opinion about this work. What do you think about
> it?
[...]
Hello all,

I am surprised to have any reply to this patch proposal. Patches have been 
correctly sent? (I didn't receive them but I am sure it come from my local 
mailer daemon since they appear on gmame). Or I am just too impatient?

I would like to know if some of you think this feature is interesting/useful? 
And do you think I take the right way?

Regards,

-- 
J?r?me Pouiller
