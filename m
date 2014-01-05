From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 11:24:58 +0100
Subject: [Buildroot] [PATCH] dbus-cpp: new package
In-Reply-To: <52BC4E9A.9050303@zacarias.com.ar>
References: <1388070026-4256-1-git-send-email-gustavo@zacarias.com.ar>
 <20131226162407.2debd602@skate> <52BC4E9A.9050303@zacarias.com.ar>
Message-ID: <CACXmVibKu_hmn4G6hwSRAscsXdcA7ViJCoFO8Kb8NUeVRJh0gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 26, 2013 at 4:43 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:

> Me neither, the problem is patching it (bin/lib separately, ditching the
> src/.libs & other references) won't be upstreamable since the option is
> right there now and i don't think upstream will want a variation on the
> subject.
> It's doable but not upstreamable i think, what do we prefer?

I think it is ok like this - Committed, thanks.

-- 
Bye, Peter Korsgaard
