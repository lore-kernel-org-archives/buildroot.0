From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 06 Oct 2013 09:00:54 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain-external: add support for
	musl C library
In-Reply-To: <20131005161800.7e9989bd@skate>
References: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1380982574-16628-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131005161800.7e9989bd@skate>
Message-ID: <ab8d78c0-a96b-4597-9013-5348d48587ff@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Hello,
>
>On Sat,  5 Oct 2013 16:16:12 +0200, Thomas Petazzoni wrote:
>
>> +	if test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
>> +		ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-arm.so.1 ; \
>
>Crap. This should indeed be conditional on the architecture. I'll fix
>that in v2 with the other comments that the patches will receive.

Ah I hadn't seen this yet... please disregard my previous mail...
