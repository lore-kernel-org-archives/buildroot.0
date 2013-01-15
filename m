From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 15 Jan 2013 23:10:04 +0200
Subject: [Buildroot] [PATCH] proxychains: bump to version 4.4
In-Reply-To: <87y5fukwa7.fsf@dell.be.48ers.dk>
References: <1358254286-5057-1-git-send-email-stefan.froberg@petroprogram.com>
 <87y5fukwa7.fsf@dell.be.48ers.dk>
Message-ID: <50F5C5AC.3050105@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

15.1.2013 22:48, Peter Korsgaard kirjoitti:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
>  Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>
> Looks, good, just one question..
>
>  Stefan> -PROXYCHAINS_SITE = http://downloads.sourceforge.net/project/proxychains/proxychains/version%20$(PROXYCHAINS_VERSION)
>  Stefan> +PROXYCHAINS_VERSION = 4.4
>  Stefan> +PROXYCHAINS_SOURCE = proxychains-$(PROXYCHAINS_VERSION).tar.bz2
>  Stefan> +PROXYCHAINS_SITE = http://codu.org/~rofl/tarballs
>
> I see the sourceforge.net site is still up. Is that still the official
> upstream location or do we need to change the url in Config.in?
>
> I see there's also a proxychains on github, but it doesn't have a 4.4
> tag. Where did you get this codu.org URL from?
>

AFAIK, this proxychains-ng 4.4  is suppose to replace that old 3.1 version.

I also followed to github from the link Thomas gave me in
http://lists.busybox.net/pipermail/buildroot/2013-January/065078.html
And that tarball location I grapped by googling proxychains and rofl0r
(the maintainer of this new proxychains version).

But now I see that I was blind and could have just easily clicked
http://sourceforge.net/projects/proxychains-ng/files from that
same github page and find the same files there...

I'll rename proxychain -> proxychain-ng,  fix that URL to point
http://downloads.sourceforge.net/project/proxychains-ng/proxychains-4.4.tar.bz2
and resubmit.

Regards
Stefan
