From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 22:00:16 +0100
Subject: [Buildroot] [PATCH/next 2/2] msmtp: enable msmtpd if MMU is
 available
In-Reply-To: <20181118115841.25688-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Nov 2018 12:58:41 +0100")
References: <20181118115841.25688-1-fontaine.fabrice@gmail.com>
 <20181118115841.25688-2-fontaine.fabrice@gmail.com>
Message-ID: <87y39qksnz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > msmtpd uses fork so enable it if MMU is available
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
