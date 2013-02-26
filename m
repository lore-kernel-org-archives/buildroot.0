From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 26 Feb 2013 08:23:38 +0200
Subject: [Buildroot] [PATCH] qt: install QML imports on target
In-Reply-To: <878v6c859c.fsf@dell.be.48ers.dk>
References: <1361355531-2909-1-git-send-email-daniel.nystrom@timeterminal.se>
 <CAHQn0kg71pmwYCTo9EbGZOFF-PO2s99pZ4GrSC2gDbuy31QUqA@mail.gmail.com>
 <878v6c859c.fsf@dell.be.48ers.dk>
Message-ID: <512C54EA.60307@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Daniel, Peter, All!

On 02/25/2013 11:15 PM, Peter Korsgaard wrote:
>  Daniel>     When selecting the Qt declarative module, all the QML imports was
>  Daniel>     built and installed to staging, but never installed to the target.
>  Daniel>     Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
>  Daniel> Bumping this patch as I think this is a good candidate for the
>  Daniel> 2013.02 release.  Currently QtDeclarative is supported by
> It would be good if someone who knows anything about Qt can ack this
> patch for 2013.02.

  I don't yet have much reputation here but looks a nice thing to add to 2013.02,
and implemented just as should be. At least, I had to do exactly the same thing
a couple of months ago (based on Buildroot 2012.08) when doing a QML project, and
wished it were in the next release :) So here it comes.

  Acked-by: Alexander Lukichev <alexander.lukichev@gmail.com>

--
Best regards,
  Alexander Lukichev
