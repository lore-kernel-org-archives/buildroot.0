From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:07:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to
 version 0.20.0
In-Reply-To: <20200906125351.2869468-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 6 Sep 2020 14:53:51 +0200")
References: <20200906125351.2869468-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2lgvx78.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-15503: LibRaw before 0.20-RC1 lacks a thumbnail size
 >   range check. This affects decoders/unpack_thumb.cpp,
 >   postprocessing/mem_image.cpp, and utils/thumb_utils.cpp. For example,
 >   malloc(sizeof(libraw_processed_image_t)+T.tlength) occurs without
 >   validating T.tlength.

 > - zlib is an optional dependency since
 >   https://github.com/LibRaw/LibRaw/commit/b63f017b063edb5e7091e3952ee20cb4d002edbe

 > Also update indentation in hash file (two spaces) as well as README.md
 > hash, no license changes:
 >  - https://github.com/LibRaw/LibRaw/commit/d1975cb0e055d2bfe58c9d845c9a3e57c346a2f9
 >  - https://github.com/LibRaw/LibRaw/commit/d38361b76e1a405a25b11165a1ee5495fc899246

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
