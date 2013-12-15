From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 09:37:59 +0100
Subject: [Buildroot] [PATCH v3] erlang: add option to enable SMP support
In-Reply-To: <1386946571-12276-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Fri, 13 Dec 2013 09:56:11 -0500")
References: <1386946571-12276-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87txeawlug.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Erlang builds two emulators depending on whether SMP is supported or
 > not. If it is known that the target does not support SMP, turning off
 > the SMP emulator saves compile time and reduces the size of the
 > installation.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > ---
 > Changes v2 -> v3: (Arnout's comments)
 >   - Replaced 'depends on' with 'if...endif'
 >   - Switched check to positive logic
 > Changes v1 -> v2: (Baruch's comments)
 >   - added sign-off

Committed, thanks.

-- 
Bye, Peter Korsgaard
