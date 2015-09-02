From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 2 Sep 2015 23:09:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez_utils: fix musl
	compilation issue
In-Reply-To: <55E77193.3060202@mind.be>
References: <1441203317-10180-1-git-send-email-brendanheading@gmail.com>
 <55E77193.3060202@mind.be>
Message-ID: <CA+BsyQ7uHePcdOVX_4QKnQmLUe9fJ=OWRkesX0oO6fROC46etQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  The current version is in bluez5_utils. It had to be a separate package because
> the API has changed from bluez4 to bluez5, so it must be possible to select one
> or the other. So this comment is not really relevant. The bluez5_utils package
> builds fine under musl BTW.
>
>  Of course, because bluez4 predates musl, there is really no reason to try to
> build bluez4 with musl, so an equally acceptable option would be to make it
> depend on !MUSL. However, I think the patch is sufficiently light to be
> acceptable. IMHO, the argument "we prefer not to carry patches that will not
> make it into upstream" doesn't apply for frozen packages, because then there is
> no maintainance effort for the patches (since there is no version bumping).

Many thanks for that Arnout, and for pointing out the bluez5 package.
Comments noted for future reference!

regards

Brendan
