From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Sep 2013 17:34:12 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
 from the URL address
In-Reply-To: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

Op 18-sep.-2013 17:25 schreef "Jerzy Grzegorek" <
jerzy.grzegorek@trzebnica.net> het volgende:
>
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---

Could you clarify why this is desirable? Note that urls with our without
trailing slash are not identical: the web server needs to properly support
this. For example, the autobuild website does not properly do it (something
very annoying ;) )

So, with a change like this, every changed url needs to be tested.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130918/dfe55954/attachment.html>
