From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 11:42:01 +0200
Subject: [Buildroot] [PATCHv2 2/2] package/supertux: build squirrel
 builtin library with fPIC
In-Reply-To: <20201003232256.549688-2-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 4 Oct 2020 01:22:56 +0200")
References: <20201003232256.549688-1-romain.naour@gmail.com>
 <20201003232256.549688-2-romain.naour@gmail.com>
Message-ID: <87r1qes4ye.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Ensure that squirrel is compiled with -fPIC to allow linking the static
 > libraries with dynamically linked programs. This is not a requirement
 > for most architectures but is mandatory for ARM.

 > Fixes:
 > http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
 > http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
