From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 10 Oct 2012 07:21:18 +0200
Subject: [Buildroot] [PATCH] webkit: Fix build issue with gcc-4.6 and
	above
In-Reply-To: <5074AB3F.8050400@gmail.com>
References: <1349385964-710-1-git-send-email-gvaxon@gmail.com>
 <5074AB3F.8050400@gmail.com>
Message-ID: <CAHXCMMJ==pQi5oOGOKsYvd9dBq6tz=MBxgVdv53cBe25HsMj7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Val,

2012/10/10 Valentine Barshak <gvaxon@gmail.com>:
>
> Is this change OK?
> I'm building on Fedora 17, using host gcc 4.7.2, and webkit doesn't build
> for me without this patch.
>
I think this will fix the Webkit issue I got when I was trying the
gettext patch set some weeks ago... but I didn't dig into it.

I'll give it a try as soon as I can.


Thanks,

-- 
Sam
