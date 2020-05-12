From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 13:00:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/c-ares: security bump to
 version 1.16.1
In-Reply-To: <20200511192935.123370-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 11 May 2020 21:29:35 +0200")
References: <20200511192935.123370-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2pxl8p8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Prevent possible use-after-free and double-free in ares_getaddrinfo() if
 > ares_destroy() is called prior to ares_getaddrinfo() completing.

 > https://c-ares.haxx.se/changelog.html#1_16_1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
