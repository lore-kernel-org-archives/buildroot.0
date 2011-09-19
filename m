From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:46:28 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
In-Reply-To: <001601cc76d6$7c3d1ac0$74b75040$@com>
References: <000301cc7486$0778f8f0$166aead0$@com>
 <20110916184409.2b4f53ae@skate>
 <001601cc76d6$7c3d1ac0$74b75040$@com>
Message-ID: <20110919224628.173080cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Sep 2011 16:14:45 +0200,
"Rico Bachmann" <bachmann@tofwerk.com> a ?crit :

> If I see this right, I have to patch the buildsystem from the
> original fcgi package?

Yes, probably. Or sometimes a workaround can be done in the package .mk
file. It depends on what the workaround is :)

> Then I could add the link to the math library
> and add the -lm to the command? Is that the right way to go? Or
> didn't I understood you right?
> 
> I'm now try to understand the automake files of the fcgi.

Can you post a proper patch (sent with git send-email so that it
doesn't get screwed up by your e-mail client) so that we can test and
help you in fixing the problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
