From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Dec 2012 21:54:30 +0100
Subject: [Buildroot] [PATCH 2/7] hostapd: remove gnutls support
In-Reply-To: <1356724043-8879-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 28 Dec 2012 16:47:18 -0300")
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
 <1356724043-8879-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877go1zym1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> hostapd isn't API compatible with gnutls3 so remove support.
 Gustavo> It's probably hardly used since openssl is far more common,
 Gustavo> and hostapd can use its internal routines if it's not
 Gustavo> available.

I've resuffled this to come before the gnutls one and committed, thanks.

-- 
Bye, Peter Korsgaard
