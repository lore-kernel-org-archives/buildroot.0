From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 20 Mar 2017 09:10:07 +0100
Subject: [Buildroot] [PATCH v2 2/2] tesseract-ocr: new package
In-Reply-To: <20170320000332.6e5e9983@free-electrons.com>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-3-git-send-email-gilles.talis@gmail.com>
 <20170319145455.27ceaa84@free-electrons.com>
 <ecfe5b92-0800-cb5c-3f22-53448c1255f9@mind.be>
 <20170320000332.6e5e9983@free-electrons.com>
Message-ID: <CAKcgs2xtSDnOLiW5-e83VbMmCXJzT00cD=jHS6_ZFvf-zsATkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

>>  That's why we have BR_NO_CHECK_HASH_FOR, no?
>
> True. But then we don't check hashes for stuff downloaded through
> Github, which potentially could change (hence the reason why I'm also
> suggesting to have a package that downloads all of the tessdata
> package, but it's huge).
First of all, thanks a lot for the corrections to my patch. and for
committing it.
Regarding the language pack, my first intention was to create a
package for the entire tessdata.
But just like you, I found out this was not a viable option.

I am open to all suggestions to make this support better though.

thanks again
Gilles.
