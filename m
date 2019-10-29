From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 11:39:24 +0100
Subject: [Buildroot] [PATCH] package/mongoose: security bump to version
 6.16
In-Reply-To: <1570983112-25650-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Sun, 13 Oct 2019 18:11:51 +0200")
References: <1570983112-25650-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87k18n6dk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Fixes the following security vulnerability:
 > CVE-2019-13503: mq_parse_http in mongoose.c in Mongoose 6.15
 > has a heap-based buffer over-read.

 > See https://github.com/cesanta/mongoose/releases/tag/6.16

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
