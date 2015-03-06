From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 06:04:03 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150306094008.7baf8c91@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>	<20150305232946.3620697e@free-electrons.com>	<54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
Message-ID: <54F96D83.4010304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 05:40 AM, Thomas Petazzoni wrote:

> I'm sorry, but I don't buy this. Separating logical changes is
> something we ask to all contributors. And the specific chunk I pointed
> at does not change at *all* when doing the 4.1 -> 4.2 bump. And even if
> some parts of it are changed by the 4.1 -> 4.2 bump, that's OK.

Well,  i've done it several times in the past, just search for "While at
it" and "Also" in the commit logs - in fact it was you who committed
them in many cases (and not only mine).
Does this mean that i should separate bumps from adding hash files
and/or renaming patches?
Because the workload and noise committing will go up higher if that's
the choice.
And how does a package style fix differ from renaming patches that's
another style fix?
Regards.
