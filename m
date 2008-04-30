From: John Voltz <john.voltz@gmail.com>
Date: Wed, 30 Apr 2008 11:25:17 -0400
Subject: [Buildroot] fixing libtool in buildroot
In-Reply-To: <87a5b0800804300818w26275393x8eb43fbdec13c1e4@mail.gmail.com>
References: <46a136670804300814n1fb0bb1bi796d5e1db3a82134@mail.gmail.com>
	<87a5b0800804300818w26275393x8eb43fbdec13c1e4@mail.gmail.com>
Message-ID: <46a136670804300825i60392054g3f1b191afef5ce95@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Packages may have more than one ltmain.sh, for example gettext.
>

Good catch. I will make it search for it instead. Hopefully that won't add
too much time to the build.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080430/d057a922/attachment.htm 
