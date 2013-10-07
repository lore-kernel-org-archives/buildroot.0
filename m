From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 07 Oct 2013 09:23:59 -0300
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <20131007135727.3cb4150d@skate>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <20131007135727.3cb4150d@skate>
Message-ID: <5252A7DF.5020008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2013 08:57 AM, Thomas Petazzoni wrote:
> Therefore, linking PHP with BerkeleyDB version 6 creates a PHP binary
> that cannot legally be distributed.
> 
> If this analysis is correct, I'd suggest one of the following options:
> 
>  * Drop the support for BerkeleyDB support in PHP.
> 
>  * Add a berkeleydb5 package that packages the last known non-AGPL
>    version of BerkeleyDB, and use that for PHP.
> 
> Considering how useful BerkeleyDB can be with PHP, I'm suggesting the
> first option.

You mean the second option right?
Otherwise you're conflicting with yourself ;)
Regards.
