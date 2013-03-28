From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Mar 2013 14:33:31 +0100
Subject: [Buildroot] [PATCH] rapidjson: new package
In-Reply-To: <CAHt8ZCOgUZq-WjNt=gFo+_f4Bmdu6KJHtXi25yzpDxShRYc-cQ@mail.gmail.com>
References: <1364472920-11835-1-git-send-email-spdawson@gmail.com>
 <20130328141527.0061ef53@skate>
 <CAHt8ZCOgUZq-WjNt=gFo+_f4Bmdu6KJHtXi25yzpDxShRYc-cQ@mail.gmail.com>
Message-ID: <20130328143331.5d73caa3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Thu, 28 Mar 2013 13:26:07 +0000, Simon Dawson wrote:

> > How does this thing work if you install only things in staging? Is
> > it a code generator that runs on the host? And if so, shouldn't
> > some stuff be installed in $(HOST_DIR) ?
> 
> Thanks for looking at this. It is a header-only library. That being
> the case, should the headers also be installed under $(HOST_DIR)?

No, if it's a header only library, then what you've done is correct.
Thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
