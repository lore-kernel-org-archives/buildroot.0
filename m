From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:44:45 +0100
Subject: [Buildroot] [PATCH 14/14] xbmc: new package
In-Reply-To: <CAGduivy=g8pGfurXSLCx9+DBYzTRN_uSoH6Lb+Cic873N4DKdA@mail.gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389549208-19078-15-git-send-email-maxime.hadjinlian@gmail.com>
 <CAGduivy=g8pGfurXSLCx9+DBYzTRN_uSoH6Lb+Cic873N4DKdA@mail.gmail.com>
Message-ID: <20140128224445.23476294@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Jan 2014 19:15:09 +0100, Maxime Hadjinlian wrote:

> You should note that XBMC needs Java to build. Currently, it uses the JRE of
> the user's machine.
> 
> I could use jamvm with its host variant, but it needs classpath to be
> built, which itself need java installed. Since I didn't see any way
> out of this, I kept it this way.

Maybe it has been discussed later on, but I'm replying to my huge
e-mail backlog in a FIFO fashion.

If this package requires Java to be installed, then we can require it
to be installed on the user's machine, like we already do for the
classpath build.

Search for BR2_PACKAGE_CLASSPATH in
support/dependencies/dependencies.sh.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
