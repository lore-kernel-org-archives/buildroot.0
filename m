From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 3 Nov 2014 08:53:34 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <20141102225411.0fe3d3de@free-electrons.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141101144354.66e2e698@free-electrons.com>
 <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
 <20141102225411.0fe3d3de@free-electrons.com>
Message-ID: <CA+TH9VmVC8N2-k_mUvf8b_gtMyXk+cgw0Wv+2Z0sM=+1SdVfRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> This doesn't seem very clean, and a bit opposite to the principle of
> CSS, no? Why don't you create a separate CSS that overrides whatever
> needs to be overridden?

For performance reasons, bootstrap developers decided that you need to
tweak variables in less files (or use the simplified web interface
here http://getbootstrap.com/customize/) and then recompile all in a
big bootstrap.min.css blob. Usually big sites with hundred of elements
stress the target cpu too much rewriting rules everywhere, so instead
having the right css from the beginning of a page download seemed the
right thing to do. My css is generate in this exact way.

Our site is small, and do only have tens of elements, so I admit that
could be a good idea rewriting only parts in which we are interested.

I'll hack a patch in the next few minutes!

Stay tuned!

Sincerely, Angelo.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
