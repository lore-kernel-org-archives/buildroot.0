From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 11:06:33 +0100
Subject: [Buildroot] [PATCH 2/4] package/tpm2-totp: bump to version 0.2.0
In-Reply-To: <20191214232602.3337220-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Dec 2019 00:26:00 +0100")
References: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
 <20191214232602.3337220-2-fontaine.fabrice@gmail.com>
Message-ID: <87o8w9ewd2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add patch to fix build failure with musl
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

I added a followup patch to explicitly disable doxygen / plymouth /
initramfstools / mkinitrd suport and to use the --disable-defaultflags
option like in tpm2-tss.

-- 
Bye, Peter Korsgaard
