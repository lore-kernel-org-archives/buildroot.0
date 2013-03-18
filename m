From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Mon, 18 Mar 2013 12:14:26 +0100
Subject: [Buildroot] Project specific packages
Message-ID: <15AE5A936F5E3A42A9144E66875A0A893089DA@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi there,

I'm trying to add some project specific packages, as described in
"Using-buildroot-real-project". Just as described, I created a <company>
folder and within that folder a <test-app> folder, with the required
Config.in and .mk files. Also adjusted the Config.in to enable/disable
my test-app package.

However, if I do a "make test-app", I get:

make: *** No rule to make target `test-app'.  Stop.

I also tried a "make <company>", to force a make of all comapny
packages, with the same result. It seems that this only succeeds, if I
move the <test-app> folder to the root of the packages. But there goes
the idea of isolating all company specific packages in one directory.

Can anyone tell me how this should be done?

N.B. I hope I'm using the right mail-address for this kind of questions.
I also took a look at the mailing-list, but this seems to be more
development related and not so much for user questions. Please let me
know if I should a different address for posting my (future) questions.

Regards,

Ruud
