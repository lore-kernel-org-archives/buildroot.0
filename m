From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 19:17:32 +0100
Subject: [Buildroot] [PATCHv3] QtSerialPort: new package
In-Reply-To: <CAGm1_kuNWVOTovggPq7CEeAJMP_PDGVXYaM+92nw6JfhcY0boA@mail.gmail.com>
 (Yegor Yefremov's message of "Sat, 3 Nov 2012 18:21:59 +0100")
References: <20121029154949.GA15033@localhost.comm5.com.br>
 <87y5iiy6pw.fsf@dell.be.48ers.dk>
 <CAGm1_kuNWVOTovggPq7CEeAJMP_PDGVXYaM+92nw6JfhcY0boA@mail.gmail.com>
Message-ID: <87wqy2wnyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 Thiago> +++ b/package/Config.in
 Thiago> @@ -133,6 +133,7 @@ source "package/sdl_gfx/Config.in"
 Thiago> comment "other GUIs"
 Thiago> source "package/efl/Config.in"
 Thiago> source "package/qt/Config.in"
 Thiago> +source "package/qtserialport/Config.in"

 Yegor> Don't we want to pull all pure Qt libs under "Qt external packages" as
 Yegor> was made with Python packages in Kconfig?

Yes, we have "QT libraries and helper libraries" where it should go.

 >> What is the relation between qtserialport and qtextserialport? Do we
 >> need both?

 Yegor> The situation with serial port libraries under Qt is not so
 Yegor> simple as with Python. I know at least 3 different libraries. So
 Yegor> having them all won't hurt.

Ok.

-- 
Bye, Peter Korsgaard
