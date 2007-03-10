From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Sat, 10 Mar 2007 16:00:15 +0100
Subject: [Buildroot] __cxa_atexit in gcc 3.4.6
Message-ID: <20070310160015.5a40c583@lama.infinity.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have browsed the ml archive but found nothing directly appropriated:
Is there any reason for putting the --disable-__cxa_atexit in the gcc
3.4.6 script? I have a binary-only library that requires __cxa_atexit
(it gives me a unresolved symbol error while linking my sources).

Thank you in advance!

Regards,

ing. Federico Fuga
