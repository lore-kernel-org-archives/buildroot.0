From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Wed, 3 Apr 2019 11:15:47 +0200
Subject: [Buildroot] [PATCH] package/luajit: bump to version 2.1.x
 developpment version
In-Reply-To: <20190403091856.274fdc7e@windsurf>
References: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
 <20190403091856.274fdc7e@windsurf>
Message-ID: <CAHpTZwkvHogtHue284vA0qUnUT7ygzA3O2Qx=Hdjor3tfKt2Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

To answer the question of Fran?ois : The luajit2.1.0-beta3 version in
http://luajit.org/download.html has not been changed since 2 years (last
change in May 2017), so I guess it is better to take a version which is up
to date.

To answer the question of Thamas : We have successfully tested bcc on a
raspberry PI 3, however; the purpose of this patch is to check that it does
not break the build process in buildroot (for example luajit2.1.0 is adding
support for aarch64; we need to ensure that it is safe).

Regards.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190403/8b06e2ea/attachment.html>
