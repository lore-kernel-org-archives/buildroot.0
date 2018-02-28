From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 21:38:31 +0100
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant - Specify that old and
 new dbus are incompatible
In-Reply-To: <20180218215039.4811-1-pinaraf@pinaraf.info> (Pierre Ducroquet's
 message of "Sun, 18 Feb 2018 22:50:39 +0100")
References: <20180218215039.4811-1-pinaraf@pinaraf.info>
Message-ID: <87fu5kkfy0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre" == Pierre Ducroquet <pinaraf@pinaraf.info> writes:

 > Building wpa-supplicant with support for both DBus interfaces
 > generates broken .service files.

In what way are they broken? I did a quick test build of 3
configurations:

- Only old
- Only new
- Old and new

and I don't see any difference in the .service files?

-- 
Bye, Peter Korsgaard
