From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 May 2013 19:47:33 -0300
Subject: [Buildroot] [PATCH 4/6] libcurl: bump to version 7.30.0
In-Reply-To: <5192BB6E.2090304@mind.be>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <1368463259-18958-4-git-send-email-gustavo@zacarias.com.ar>
 <5192BB6E.2090304@mind.be>
Message-ID: <5192BF05.5000803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/2013 07:32 PM, Arnout Vandecappelle wrote:
>  Is the --with-random now needed without ssl as well?

It's needed for all the SSL implementations and it doesn't hurt if
there's none.
So it's there to avoid duplication.

>> +LIBCURL_DEPENDENCIES += openssl
> 
>  ... and duplicating it certainly isn't!

Ouch! I'll fix it.

>  No need for ca-path? (Same for the others.)

Just for openssl, and it errors for any other option, isn't that nice? :)
Thanks.
Regards.
