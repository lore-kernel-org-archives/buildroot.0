From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 22:11:29 +0100
Subject: [Buildroot] [PATCH 1/2] configs/qemu/x86_64: enable USB support
In-Reply-To: <1457557499-6532-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 9 Mar 2016 18:04:58 -0300")
References: <1457557499-6532-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mcfz79a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > We're not trying to be minimal here, and qemu can bridge/emulate certain
 > usb devices, so enable the different controllers and at least usb
 > storage.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
