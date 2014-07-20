From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 20 Jul 2014 21:27:07 +0200
Subject: [Buildroot] uClibc-ng
In-Reply-To: <20140720191326.GD4431@waldemar-brodkorb.de>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
Message-ID: <148124bb-7b66-4363-b171-f0164dab3ced@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Waldemar Brodkorb <wbx@uclibc-ng.org> schreef:
>Hello Embedded Linux Hackers,
>
>it seems there is no plan to release a new uClibc version.
>The current maintainer does not response on any public or private mails
>about a plan to do a needed release. Therefore most of you carrying a lot
>of patches against uClibc 0.9.33.2 to make it work in your project.
>A really ugly situation. 
>
>To get out of this situation I started a spin-off called uClibc-ng.
>The website for the project is here: http://www.uclibc-ng.org
>Beta 3 is tagged and downloadable via 
>http://downloads.uclibc-ng.org/uClibc-ng-1.0.0beta3.tar.xz
>
>If you want a 1.0 in the near future please test and report back any
>issues. You can use the bug tracker, the mailing list or dicussion forum
>to report back. To prevent spam you need to be subscribed or registered.
>
>I have added most of the patches from your projects on top of uClibc
>master.

Interesting development!
One question: how do you see musl vs uclibc-ng in the future? At this moment uclibc supports more architectures, but this may change. Do you think both should/can coexist? What are the distinctive features of uclibc over musl, according to you?

Thanks,
Thomas
