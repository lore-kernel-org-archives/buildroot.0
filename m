From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 19:30:14 +0200
Subject: [Buildroot] [PATCH v3] barebox: add an option to embed
 environment image
In-Reply-To: <CAGm1_ktZovu04emMf9Xgpm4EadvnVttude3atO98zzii1CEgew@mail.gmail.com>
References: <1462360499-29955-1-git-send-email-yegorslists@googlemail.com>
 <20160505155645.53ec9414@free-electrons.com>
 <CAGm1_ktZovu04emMf9Xgpm4EadvnVttude3atO98zzii1CEgew@mail.gmail.com>
Message-ID: <20160505193014.59240f3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2016 17:17:54 +0200, Yegor Yefremov wrote:

> We've already discussed this. Both images can be useful together.
> Embedded image contains recovery scripts and external image real
> scripts, variables. For example at production stage you don't have
> external image, so embedded one takes care, after production external
> image will be used and so on.

OK. Sorry for asking the same question again, there's so many different
topics going on at the same time that I easily lose track of previous
discussions. Whenever this sort of discussion happens, it's a good idea
to improve the commit log in the next iterations of the patch with the
result of the discussion. Not only this avoids getting asked the same
questions, but it also means that the discussion/reasoning gets kept in
the Git history, which might prove useful in the future.

Can you nonetheless resend a v4 with the minor improvements suggested
by Arnout (and possibly with an improved commit log explaining why we
need to support both an "external" environment and an "embedded"
environment) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
