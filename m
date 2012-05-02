From: Shawn Ferris <shawn.ferris@gmail.com>
Date: Tue, 1 May 2012 23:13:50 -0600
Subject: [Buildroot] Enabling debugging symbols in packages..
In-Reply-To: <20120502041303.GA31267@sapphire.tkos.co.il>
References: <CAC2kKA8s_8d=u2BDz4Ai0GA_QEru6+76dY3=0_3=s75jjK=QxA@mail.gmail.com>
 <20120502041303.GA31267@sapphire.tkos.co.il>
Message-ID: <CAC2kKA_L9EZt+WWW6Dn4uX2+V_Bj7JxLEYY605pS8GhXDbw3Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Target binaries get striped after build, thus removing debugging info. To
> disabled this behaviour go to "Build options" -> "strip command for binaries
> on target", and select "none".

Doh! That was it indeed.. is there a reason this isn't disabled
automatically when debugging is enabled? Not that it matters now that
I know it's there, just curious :D

Thanks for your help.. I appreciate it!

Shawn
