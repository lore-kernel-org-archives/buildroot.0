From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 17:14:22 +0100
Subject: [Buildroot] [PATCH] vlc: security bump to version 2.1.6
In-Reply-To: <1425052318-21287-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 27 Feb 2015 12:51:58 -0300")
References: <1425052318-21287-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878ufj1gdd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > * Fix heap overflow in decomp stream filter
 > * Fix buffer overflow in updater
 > * Fix potential buffer overflow in schroedinger encoder
 > * Fix null-pointer dereference in DMO decoder
 > * Fix buffer overflow in parsing of string boxes in mp4 demuxer
 > * Fix SRTP integer overflow
 > * Fix potential crash in zip access
 > * Fix read overflow in Ogg demuxer

 > And also add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
