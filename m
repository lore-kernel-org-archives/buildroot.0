From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 17 Dec 2013 11:43:29 +0000
Subject: [Buildroot] [PATCH] bonnie: does not support static builds
In-Reply-To: <20131217124149.312b1d8e@skate>
References: <1387279718-6528-1-git-send-email-spdawson@gmail.com>
 <20131217124149.312b1d8e@skate>
Message-ID: <CAHt8ZCOrNPe8YBjAX_BHfRFB+9BXCBNssHx+bCBgayiS3QCgjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 17 December 2013 11:41, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I need to test this specific case, but I don't think this is the
> correct fix. If you look at the config.log file, I'm pretty sure you
> will see that configure bails out because libstdc++.a does not exist.
> This is a problem in the internal toolchain rework I've done, and that
> I need to have a look at (make sure it generates the static version of
> libstdc++).

Right.

> Therefore, I don't think this patch should be applied: bonnie++, by
> itself, does not require dynamic library.

Okay; I did wonder, to be honest. Thanks for the feedback.

Simon.
