From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Dec 2015 21:05:46 -0300
Subject: [Buildroot] [PATCH v2] gnutls: fix --disable-crywrap
In-Reply-To: <20151215215004.282f0afc@free-electrons.com>
References: <1450129196-15461-1-git-send-email-gustavo@zacarias.com.ar>
 <20151215215004.282f0afc@free-electrons.com>
Message-ID: <5670AADA.1080605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/12/15 17:50, Thomas Petazzoni wrote:

> Gustavo,
>
> On Mon, 14 Dec 2015 18:39:56 -0300, Gustavo Zacarias wrote:
>> Add a patch to really enable the --disable-crywrap option in gnutls.
>> Fixes:
>> http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5/
>>
>> Status: sent upstream (mailing list).
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> This patch does not apply (probably because it was based in your tree
> on other commits that are not in the official Buildroot git repo).
> Also, it would be good if you could take into account the two comments
> made by Baruch.

Hi.
It does, after the licensing fixes that were previously sent.
As i mentioned to Baruch and you probably already know, mailing list 
archives usually don't update quickly, so i didn't have a URL to copy/paste.
Mundanely trivial v3 sent.
Regards.
