From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 10:24:47 +0200
Subject: [Buildroot] [PATCH] micropython: new package
In-Reply-To: <CAFOYHZAWy7NpB2eXw20RmRaw6j3ySvxeWf9n6mhKrGL_9jhdfw@mail.gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <20150914155829.1d326cc0@free-electrons.com>
 <55F6D5C5.9090504@imgtec.com>
 <CAFOYHZAWy7NpB2eXw20RmRaw6j3ySvxeWf9n6mhKrGL_9jhdfw@mail.gmail.com>
Message-ID: <20150915102447.2c6871b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Tue, 15 Sep 2015 11:03:35 +1200, Chris Packham wrote:

> > It shouldn't conflict as micropython installs the library files under
> > /usr/lib/micropython/ directory. And the installed binaries are
> > /usr/local/bin/{pip-}micropython. Perhaps this should be changed to
> > install them in /usr instead of /usr/local.
> 
> The local part seems hard-coded to me. But we could always sed it on
> the way through.

It's not normal for Buildroot systems to have stuff in /usr/local.
Perhaps you could write a patch for micropython to make this
configurable and submit the patch upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
