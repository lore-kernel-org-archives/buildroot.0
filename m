From: Alexander Varnin <fenixk19@mail.ru>
Date: Fri, 29 Nov 2013 01:34:43 +0400
Subject: [Buildroot] ucilbc 0.9.33.2 fails to build on buildroot 2013.11
 internal toolchain
In-Reply-To: <20131128192508.4c4c0106@skate>
References: <5297837C.3@mail.ru> <20131128192508.4c4c0106@skate>
Message-ID: <5297B6F3.9010308@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

28.11.2013 22:25, Thomas Petazzoni ?????:
> Either disable BR2_ENABLE_DEBUG in Buildroot (which will disable
> debugging support for all packages), or if you want to keep debugging
> support enabled globally but don't care about debugging support in
> uClibc, apply a change like:

Yes, disabling uClibc debugging done the trick.
Thank you. I'll use this workaround for now.
