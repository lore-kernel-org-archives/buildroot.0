From: Richard Braun <rbraun@sceen.net>
Date: Sat, 20 Oct 2012 23:55:47 +0200
Subject: [Buildroot] [PATCH] pkg-infra: produce legal info for
 proprietary packages
In-Reply-To: <50830EB4.9090200@lucaceresoli.net>
References: <20120928121758.GA2362@mail.sceen.net>
 <1348834801-2672-1-git-send-email-rbraun@sceen.net>
 <20120928142314.4810033e@skate>
 <CAAXf6LUF1bOSTGyMtC2OEbQSOeDiMphktpxtSZHmLj4ms9c+yQ@mail.gmail.com>
 <20120928190526.79db5cde@skate>
 <CAAXf6LVi1SKx9ZTDuROYxkP=r62fr=SpMnNxYc-Q=_bz+7Snsg@mail.gmail.com>
 <5068558E.4070005@mind.be> <506AEF12.5080906@lucaceresoli.net>
 <20121016154229.GA15417@mail.sceen.net>
 <50830EB4.9090200@lucaceresoli.net>
Message-ID: <20121020215547.GA13307@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 20, 2012 at 10:51:00PM +0200, Luca Ceresoli wrote:
> This in confusing. In your previous e-mail dated Sep 20you quoted the
> "Intel Software License Agreement", that one is supposed to accept before
> downloading the package from the web page:

Confusing indeed.

> What hurts me a little is that, if intel-microcode turns out to be
> redistributable, we would have no use case in mainline Buildroot that
> makes use of such a feature to the legal-info code.

That's what troubles me as well. I don't want to introduce dead code.
But if you do it as you seem to have planned, then I won't worry about
it and just wait for the feature.

I'll try to get some clarification from Intel in the meanwhile. Thanks
for your answer.

-- 
Richard Braun
