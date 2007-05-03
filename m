From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Thu, 3 May 2007 10:35:52 +0200
Subject: [Buildroot] gcc-4.1.2 eabi softfloat toolchain,
	undefined reference to "raise"
In-Reply-To: <20070430125731.GC18543@aon.at>
References: <20070426080257.GA7608@z1.synertronixx>
	<20070430125731.GC18543@aon.at>
Message-ID: <20070503083551.GB2783@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-04-30 14:57 +0200 schrieb Bernhard Fischer:

> This is a known bug with gcc. There is a bugfix (that i don't really
> understand and consequently don't know if it is really accurate)
> floating around for this one.

Well I searched like mad but I did not find one.
I digged around and added an empty raise() function and my bootloader
compiled after that and the binary runs fine so far. Hmm...

> If in doubt, please file a PR in http://gcc.gnu.org/bugzilla/ about this bug
> and perhaps add a pointer to the patch if this bug is not yet entered in
> bugzilla.

I will enter it. 

Regards, Konsti

-- 
synertronixx GmbH
Dipl.-Ing. (FH) Konstantin Kletschke
Vahrenwalder Str. 7
30165 Hannover
Tel.    : 0511 / 3574 - 661
Fax     : 0511 / 93 57 - 679
E-mail  : kletschke at synertronixx.de
Internet: http://www.synertronixx.de
Vertretungsberechtigte Gesch?ftsf?hrer:
Marc-Oliver Borck, Dr. Matthias Blaschke
Registergericht: Amtsgericht Hannover
Registernummer: HRB 59670
USt-ID: DE 216 559 901
