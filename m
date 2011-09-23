From: Allan W. Nielsen <a@awn.dk>
Date: Fri, 23 Sep 2011 13:35:01 +0200
Subject: [Buildroot] Comments on boost package
Message-ID: <1316777702-12037-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thanks for your comments on the boost package.

I have done all the corrections you suggested except this one:

> +BOOST_WITHOUT_FLAGS_COMMASEPERATED = $(shell echo
        > $(BOOST_WITHOUT_FLAGS) | tr ' ' ',')
>
> Maybe this can be done with a make $(subst ...) call.

I simply could not get it to work.

Beside, I have removed python support as I had troubles testing it.

Let me know it there is any thing else

Best regards
Allan W. Nielsen
