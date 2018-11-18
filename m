From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 22:00:12 +0100
Subject: [Buildroot] [PATCH/next 1/2] msmtp: bump to version 1.8.0
In-Reply-To: <20181118115841.25688-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 12:58:40 +0100")
References: <20181118115841.25688-1-fontaine.fabrice@gmail.com>
Message-ID: <8736rym78j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Update site to https://marlam.de/msmtp/ (see
 >   https://sourceforge.net/projects/msmtp)
 > - Replace libidn by libidn2:
 >   https://github.com/marlam/msmtp-mirror/commit/0d8be2a35f0c7757d1f423e2d21f042626fec60e
 > - Disable msmtpd (minimal SMTP server) as it uses fork:
 >   https://github.com/marlam/msmtp-mirror/commit/e0bc975fbfb8b26a6dfaac87ebc64d3f37ef1e36

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
