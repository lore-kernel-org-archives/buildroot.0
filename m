From: Daniel Potapov <yeso@bk.ru>
Date: Sun, 6 Nov 2011 20:20:11 +0700
Subject: [Buildroot] buildroot stops at pango compilation
In-Reply-To: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
References: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
Message-ID: <CAC=eiqy1_-atsKHX4SE0a_KS1b_qJdzzihr+emoSSY0RDco1mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to compile stable version buildroot 2011.08 with libgtk
support, but it stops at pango compilation (I've attached output) with
a lot of such messages:

In file included from hb-open-file-private.hh:30,
? ? ? ? ? ? ? ? ?from hb-font.cc:31:
hb-open-type-private.hh:380: error: size of array
'_static_assert_on_line_380_failed' is negative
hb-open-type-private.hh:381: error: size of array
'_static_assert_on_line_381_failed' is negative
hb-open-type-private.hh:454: error: size of array
'_static_assert_on_line_454_failed' is negative
In file included from hb-font.cc:31:
hb-open-type-private.hh: In instantiation of 'Null<OffsetTable>':
hb-open-file-private.hh:71: ? instantiated from here
hb-open-type-private.hh:70: error: creating array with negative size
('-0x000000001')
hb-open-file-private.hh:129: error: size of array
'_static_assert_on_line_129_failed' is negative


Could you please help me with that?

Thanks in advance.

--
Best regards,
Daniel
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot_output.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111106/be5cab3e/attachment.txt>
