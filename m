From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 14:08:34 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/qt5webkit: add patch to fix
 ICU related compile failure
In-Reply-To: <20200202190824.9856-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 2 Feb 2020 20:08:24 +0100")
References: <20200202190824.9856-1-ps.report@gmx.net>
 <20200202190824.9856-2-ps.report@gmx.net>
Message-ID: <87tv47lsx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes (usage of ICU U16_NEXT() macro without trailing semicolon):
 >   platform/graphics/SegmentedFontData.cpp:65:9: error: expected ?;? before ?if?
 >   dom/Document.cpp:3850:5: error: expected ?;? before ?if?
 >   dom/Document.cpp:3855:9: error: expected ?;? before ?if?
 >   dom/Document.cpp:3918:9: error: expected ?;? before ?if?

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  ...005-Fix-ICU-related-compile-failures.patch | 67 +++++++++++++++++++

Committed, thanks.

What about the 5.6 version?

-- 
Bye, Peter Korsgaard
