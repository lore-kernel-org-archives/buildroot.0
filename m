From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 23:42:54 +0200
Subject: [Buildroot] [PATCH v3] update microblaze qemu boards to 3.14
In-Reply-To: <1398799090-13360-1-git-send-email-wbx@openadk.org> (Waldemar
 Brodkorb's message of "Tue, 29 Apr 2014 21:18:10 +0200")
References: <1398799090-13360-1-git-send-email-wbx@openadk.org>
Message-ID: <87eh0dqiox.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > - fix networking in Qemu using a small patch
 > - disable DTS, because linux.bin does not include any DTB the
 >   default Qemu included DTB is used and this is okay and works fine

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 > ---
 > Changes v2 -> v3:
 >   - reference correct patch
 > Changes v1 -> v2:
 >   - remove default BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 >   - update to 3.14.2

Committed, thanks.

-- 
Bye, Peter Korsgaard
