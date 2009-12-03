From: Stefan Schake <caytchen@gmail.com>
Date: Thu, 3 Dec 2009 15:02:04 +0100
Subject: [Buildroot] iconv conversion issues on target
Message-ID: <e4b6ec780912030602h418c4960ld762c9e9b7dcb6b0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

When running mplayer on the target, I get alot of "iconv: conversion
from US-ASCII to ASCII unsupported" messages. This is not limited to
mplayer though, I get the same when running programs dependent on glib
for example, "GLib: Cannot convert message: Could not open converter
from 'UTF-8' to 'ASCII'".
I have attached my buildroot config and the output of iconv -l from
target, hopefully somebody can tell me what went wrong here :)

Greetings
-------------- next part --------------
/usr/bin # iconv -l
Recognized codesets:
  WCHAR_T
  UCS-4
  UCS-4BE
  UCS-4LE
  e4UTF-32

  ?UTF-32BE
        ?UTF-16
  eq}?????????
  -10
  ARMSCII-8
  ASCII
  CP1251
  CP1255
  GEORGIAN-PS
  ISO-8859-1
  ISO-8859-10
  ISO-8859-13
  ISO-8859-14
  ISO-8859-15
  ISO-8859-16
  ISO-8859-2
  ISO-8859-3
  ISO-8859-4
  ISO-8859-5
  ISO-8859-6
  ISO-8859-7
  ISO-8859-8
  ISO-8859-9
  KOI8-R
  KOI8-T
  KOI8-U
  TIS-620

-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 33784 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091203/40b42346/attachment-0001.obj>
