From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Dec 2016 14:49:25 +0100
Subject: [Buildroot] mtd-utils 2.0.0-rc2
In-Reply-To: <1481887885.31185.8.camel@embedded.rocks> (=?utf-8?Q?=22J?=
 =?utf-8?Q?=C3=B6rg?= Krause"'s
 message of "Fri, 16 Dec 2016 12:31:25 +0100")
References: <c7590022-cf5a-f785-6a39-1a76a3054bda@sigma-star.at>
 <1481887885.31185.8.camel@embedded.rocks>
Message-ID: <878trgasre.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

>> There has been little feedback on the new autotools based build
 >> system so far, so
 >> it would be great if someone could give it try on the release
 >> candidate and give
 >> us some feedback _now_, so we don't ship a final version that fails
 >> to build on
 >> some obscure setup or target I didn't think of.

 > I tested building mtd 2.0.0-rc2 by using the autotools-package
 > infrastructure. I have two remarks:

 > 1/ zlib is only required by mkfs.jffs2 and mkfs.ubifs
 > 2/ Buildroot offers the possibility to install the "integck" tool on
 > the target. This is not covered by mtd, yet.

 > Apart from those, the build works fine.

Thanks for testing J?rg (and you David/Richard for moving to a standard
build system). I wanted to test as well, but I haven't found time for it
yet.

-- 
Bye, Peter Korsgaard
