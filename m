From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 14:48:32 +0200
Subject: [Buildroot] [PATCH 1/3] m4: bump to version 1.4.17
In-Reply-To: <1380716926-24611-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Oct 2013 09:28:44 -0300")
References: <1380716926-24611-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761tfrg7z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Remove MB_CUR_MAX patch since it's unnecessary/insufficent for
 Gustavo> non-wchar compilation since
 Gustavo> c29e01e61e5754c446eb524f65b01195cf25cbcc

 Gustavo> no-gets patch unnecessary also since it's been fixed.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
