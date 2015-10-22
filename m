From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 22:55:15 +0200
Subject: [Buildroot] [git commit] util-linux: disable systemd support
In-Reply-To: <20151022204841.GM21428@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 22 Oct 2015 22:48:41 +0200")
References: <20151022204331.ADB7481D8B@busybox.osuosl.org>
 <20151022204841.GM21428@waldemar-brodkorb.de>
Message-ID: <87twpik4i4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

>> +# system depends on util-linux so we enable systemd support
 >> +# (which needs systemd to be installed)
 >> +UTIL_LINUX_CONF_OPTS += \
 >> +	--without-systed \

 > I think this must be a typo:
 > $ ./configure --help|grep systemd
 >                           systemd)
 >   --with-systemd          build with support for systemd

Argh, indeed. I moved the lines further down and reworded the comment
just before committing, and apparently fat fingered it :/

Fixed in git, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
