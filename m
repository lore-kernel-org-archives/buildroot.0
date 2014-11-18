From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 16:46:54 -0300
Subject: [Buildroot] [PATCH 3/9] ifupdown: new package
In-Reply-To: <CABbD_XBtqRu2L6rPmxjpp3TgoOMADTeVQXRpRMt4qKjRey0tdg@mail.gmail.com>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>	<1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>	<CABbD_XCy1Nayf0SrA0Ae-vsFaKoM8xskE6K6UafmzN4=6aamwA@mail.gmail.com>
 <CABbD_XBtqRu2L6rPmxjpp3TgoOMADTeVQXRpRMt4qKjRey0tdg@mail.gmail.com>
Message-ID: <546BA22E.8070603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2014 04:42 PM, K?roly Kasza wrote:

> I don't know how should I propose a patch to a pending patch :)
> So here's attached a patch file, to be put into the package/ifupdown
> directory.

Hi Karoly.
Thanks for spotting this one, i tested on Gentoo thinking "there's
nothing more different than Debian" and i had debianutils installed hah.
Actually just doing:

my $DEB_HOST_ARCH_OS = "linux";

...in defn2c.pl is enough.

I'll add the minor patch.
Regards.
