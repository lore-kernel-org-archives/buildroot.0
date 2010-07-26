From: JNY <jny0@hotmail.com>
Date: Mon, 26 Jul 2010 00:49:37 -0700 (PDT)
Subject: [Buildroot] GetTime() no longer works after toolchain rebuild
In-Reply-To: <20100724194745.12aa8889@surf>
References: <29238584.post@talk.nabble.com>
	<AANLkTikKay6hseM5TaLwOuBTci4YqXUn+YhQTrg0o9YT@mail.gmail.com>
	<20100724194745.12aa8889@surf>
Message-ID: <29264057.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi People,

OK, GetTime() is irrellivent (and as I suspected, shouldn't actually be
there).  I started debugging by hand (dropping in printf's here and there -
I really should get a handle on GDB some time soon).  After one of the
recompiles, it managed to get to a point it hadn't previously.  Now
everytime I change the code, and recompile, it runs on the target machine. 
I'm not really sure why it started working, but that's exactly what I did; a
few recompiles, and kah-boom, I was in business!

Thanks for showing an interest.  Maybe others have experianced similar
things.  I'm slightly soncerned, as I didn't actually do anything (much) to
banish the demon, so cannot rule out the rearing its head again.

Regards,
JNY
-- 
View this message in context: http://old.nabble.com/GetTime%28%29-no-longer-works-after-toolchain-rebuild-tp29238584p29264057.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
