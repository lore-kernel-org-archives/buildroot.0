From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 23:38:56 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXj9m1Vo8W5SJGGBHCyiRj=gUP=574Xjcqvn1jhnZZwgg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 3 Oct 2013 10:34:30
 +0200")
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <OF28FCBE52.CC9DE764-ON86257BF8.00513AFD-86257BF8.006773C0@rockwellcollins.com>
 <CAAXf6LXj9m1Vo8W5SJGGBHCyiRj=gUP=574Xjcqvn1jhnZZwgg@mail.gmail.com>
Message-ID: <87bo36m3v3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 Thomas> While I don't need the URL for my process, I currently also
 Thomas> don't need the name of the tarball in manifest.csv (and I leave
 Thomas> out this last column anyway). So, I'm not opposed to adding
 Thomas> this extra column, but there may be some caveats: with the
 Thomas> OVERRIDE_SRCDIR mechanism it is possible for a project to
 Thomas> completely change the sources of an existing package in
 Thomas> buildroot. Strictly speaking this could mean that there is no
 Thomas> relation whatsoever between the URL specified in the .mk file
 Thomas> and the actual sources used. This is probably very exotic,
 Thomas> though, and maybe it doesn't really matter for your process.

Same could be said about the other fields (license, license files). In
general, you can only expect the legal-info stuff to be (hopefully)
valid if you don't override.

But yeah, I would be OK with adding the upstream URL (as in <pkg>_SITE).

-- 
Bye, Peter Korsgaard
