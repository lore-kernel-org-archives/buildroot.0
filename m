From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 10 Jul 2012 16:06:59 -0700
Subject: [Buildroot] A libtool question
In-Reply-To: <CALo-6+gKacOX3LhTyH52Ue_gNBJCFCw1HaLbNN6kQKde1KUPhQ@mail.gmail.com>
References: <CALo-6+g5zr8MVVVjG9fEFo5sgsVOk2uxwxzkPbb=e=U0zNwcZw@mail.gmail.com>
 <4FFB3F22.8090206@mind.be>
 <CALo-6+i876a7Pi+TAJ+1TuiHnzvYWPDqHXt+9TB=PCYGtEketw@mail.gmail.com>
 <CALo-6+gKacOX3LhTyH52Ue_gNBJCFCw1HaLbNN6kQKde1KUPhQ@mail.gmail.com>
Message-ID: <CALo-6+gXE8JqGYDohOMKdGxkXYK2NP8CNsk47=g-tQLK4hXM4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think I have a little further on the libtool issue I am seeing. It
seems to follow the use of an external toolchain
(arm-arago-linux-gnueabi-). If I allow buildroot to create its own
uclibc toolchain, I dont get this error.

Charles
