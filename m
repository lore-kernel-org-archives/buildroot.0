From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 8 Apr 2009 12:47:42 -0500
Subject: [Buildroot] DBUS keeps getting installed...
In-Reply-To: <200904081213.21064.lsargent@txdigital.com>
References: <200904081213.21064.lsargent@txdigital.com>
Message-ID: <20090408174742.GA30358@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Perhaps I misread something, but I was under the impression that if DBUS was 
> not set, then it wouldn't be included in the build?
> 
So, did you select HAL to build? You could grep for 'dbus' in packages/*/*.mk
to see what packages depend on dbus being built.

Steve
