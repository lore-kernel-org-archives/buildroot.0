From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Nov 2014 17:29:23 +0100
Subject: [Buildroot] [PATCH 8/9] manual: Harmonize command example
In-Reply-To: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1416068964-22529-8-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To facilitate copy/paste for manual's reader, remove anything before
command example.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/customize-outside-br.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 5d63e60..2b01433 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -30,30 +30,30 @@ but if it's passed as a relative path, it is important to note that it
 is interpreted relative to the main Buildroot source directory, *not*
 to the Buildroot output directory.
 
-Some examples:
+Some examples, assuming you are inside the main Buildroot source directory:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
+make BR2_EXTERNAL=/path/to/foobar menuconfig
 -----
 
 From now on, external definitions from the +/path/to/foobar+
 directory will be used:
 
 -----
- buildroot/ $ make
- buildroot/ $ make legal-info
+make
+make legal-info
 -----
 
 We can switch to another external definitions directory at any time:
 
 -----
- buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
+make BR2_EXTERNAL=/where/we/have/barfoo xconfig
 -----
 
 Or disable the usage of external definitions:
 
 -----
- buildroot/ $ make BR2_EXTERNAL= xconfig
+make BR2_EXTERNAL= xconfig
 -----
 
 +BR2_EXTERNAL+ allows three different things:
-- 
2.1.3
