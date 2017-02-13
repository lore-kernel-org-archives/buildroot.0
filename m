From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Feb 2017 17:05:48 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170213142952.302e6ee4@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 13 Feb 2017 14:29:52 +0100")
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
 <20170212151431.1fe6cce3@free-electrons.com>
 <5160b52a-c48a-4b52-3d0e-9d73a6fb5c37@cartelsol.com>
 <20170213142952.302e6ee4@free-electrons.com>
Message-ID: <871sv2m5yb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > My understanding is that the build dependency is:

 > 	jamvm -> classpath

 > i.e the classpath package needs to be built/installed before we build
 > the jamvm package. If that's the case, then I would keep the "select
 > BR2_PACKAGE_CLASSPATH" in jamvm/Config.in, but get rid of the "depends
 > on BR2_PACKAGE_JAMVM" in classpath/Config.in.

 > Peter, you're the one who added classpath originally (commit
 > 5062f530081913bd0487f0f879be180f30836ab8) including this "depends on
 > BR2_PACKAGE_JAMVM" dependency. What do you think ?

I don't recall the details, but as far as I remember the thinking was
that classpath only made sense if we have a jvm (and jamvm is our only
jvm).

-- 
Bye, Peter Korsgaard
