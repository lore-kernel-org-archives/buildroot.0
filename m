From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 22:21:05 +0100
Subject: [Buildroot] Patch a buildroot package's libfoo.mk file?
In-Reply-To: <CABDNR163vv83d7tvOwdQoOs1AGnycts0mNde_fzvHmHvy68+YQ@mail.gmail.com>
 (Michael Sumulong's message of "Fri, 21 Nov 2014 13:54:58 -0500")
References: <CABDNR163vv83d7tvOwdQoOs1AGnycts0mNde_fzvHmHvy68+YQ@mail.gmail.com>
Message-ID: <87zjbkntby.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Sumulong <msumulong@gmail.com> writes:

 > I am using the avahi package that comes with buildroot but there's a
 > configuration option that I'd like to use (--enable-compat-libdns_sd) that
 > I don't think the whole buildroot community would need. Is it possible to
 > apply a patch from a source dir (BR2_EXTERNAL) to package/avahi/avahi.mk
 > using buildroot patching framework?

Please give Buildroot 2014.11-rc2 a try. I've added an option for the
libdns-sd compat handling during the 2014.11 cycle
(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY).

-- 
Bye, Peter Korsgaard
