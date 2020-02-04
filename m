From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 22:49:52 +0100
Subject: [Buildroot] [PATCH] package/bluez-alsa: fix location of alsa
 config files
In-Reply-To: <20200201105640.8428-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sat, 1 Feb 2020 11:56:40 +0100")
References: <20200201105640.8428-1-joerg.krause@embedded.rocks>
Message-ID: <87v9omvx8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Since alsa-lib version 1.1.7 [1] the location for add-on config files
 > has changed.

 > In fact, the path for the alsa add-on config files has never been
 > correct set in the package (it should have been
 > `/usr/share/alsa/alsa.conf.d`).

 > With alsa-lib version 1.1.7 or later the correct path is
 > `/etc/alsa/conf.d`.

 > [1] https://github.com/alsa-project/alsa-lib/commit/93e03bdc2a3dcd5d12516f5de78e14d88a32ff2c

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
