From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 08:59:29 +0200
Subject: [Buildroot] build process needs host executable
In-Reply-To: <20090416212454.5D43A1C806D@whitealder.osuosl.org> (Chris Bare's
	message of "Thu\, 16 Apr 2009 17\:23\:16 -0400 \(EDT\)")
References: <20090416212454.5D43A1C806D@whitealder.osuosl.org>
Message-ID: <87preyh99q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Bare <chris@bareflix.com> writes:

Hi,

 Chris> Can anyone point me to an example of how this was dealt with
 Chris> in other packages?  In this case, I don't think the executable
 Chris> is needed on the target, it is just part of the build process.

Look at the packages we have which first build a -host version and
uses the binaries from there. dbus-glib is an example (it needs
dbus-binding-tool).

-- 
Bye, Peter Korsgaard
