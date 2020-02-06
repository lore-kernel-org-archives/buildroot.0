From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Feb 2020 19:28:05 +0100
Subject: [Buildroot] [PATCH 4/6 v2] boot/barebox: license files hashes
 only valid for latest version
In-Reply-To: <74a46f7ad7c46107c84347edb01879239a7a824b.1580914115.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 5 Feb 2020 15:48:41 +0100")
References: <cover.1580914115.git.yann.morin.1998@free.fr>
 <74a46f7ad7c46107c84347edb01879239a7a824b.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <87blqbzi2y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We can only know the path to the license files for the known version.
 > For custom, older or newer, versions may change, or may be moved
 > around.

 > So, do for U-Boot as was done for ATF, linux, and linux-headers, and

s/U-Boot/Barebox/ ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
