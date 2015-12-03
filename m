From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 21:39:17 +0100
Subject: [Buildroot] [PATCH] hostapd: make ACS optional
In-Reply-To: <1449160838-15039-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 Dec 2015 13:40:38 -0300")
References: <1449160838-15039-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87h9jzclmy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Make ACS (Automatic Channel Selection) support in hostapd optional.
 > There's a clash of standard vs. propietary solutions, hence when hostapd
 > has builtin ACS support (standard) and it's enabled (channel=0 in the
 > config) this will preclude the propietary driver from using ACS (it
 > won't work at all).

 > See:
 > http://e2e.ti.com/support/wireless_connectivity/f/307/p/465333/1669270

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
