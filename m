From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 9 Sep 2020 14:10:05 +0200
Subject: [Buildroot] Patchwork: In-Reply-To ignored?
Message-ID: <1e18d517-9652-d048-1e4c-ebc0f1c131e8@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

according to the BR Documentation:

'You can also add the --in-reply-to <message-id> option when submitting
a patch to the mailing list. The id of the mail to reply to can be found
under the "Message Id" tag on patchwork. The advantage of in-reply-to is
that patchwork will automatically mark the previous version of the patch
as superseded.'

I sent the v3 of this patch with the --in-reply-to parameter [0].

But the v2 of the patch is not marked as superseeded on patchwork [1].

I checked the headers on Patchwork, the "In-Reply-To:" field is present
and the ID is matching the one of v2.

Can you tell me if I did something wrong or is this feature of patchwork
not working?


Regards,
Michael


[0]
http://patchwork.ozlabs.org/project/buildroot/patch/20200909114830.2284662-1-buildroot at heine.tech/
[1]
http://patchwork.ozlabs.org/project/buildroot/patch/20200811112617.844338-1-buildroot at heine.tech/
