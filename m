From: Ryota Kinukawa <pojiro.jp@gmail.com>
Date: Sun, 16 May 2021 09:51:23 +0900
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <20210515094010.GA2506@scaer>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
Message-ID: <CAALxPJ35mhfqgK0aVoz4k+6u0vpw6GBcUCj6TJ_xs62zJE7Eew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann-san

> So, lets do it that way;
>  1. add a check in support/dependencies/dependencies.sh that patch >=
>     2.7 (just after/before the check for --no-backup-if-mismatch)
>  2. drop the test for renames in support/scripts/apply-patches.sh
> Ryota, would you care to work on that and send the patches to the list,
> please?


Thank you for the opportunity to contribute buildroot.
This is my first time to contribute to buildroot,
so it may take me a while to learn how to do it. But I'd like to, please
let me try.

Regards,
Ryota Kinukawa
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210516/abefbef2/attachment.html>
