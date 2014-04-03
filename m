From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:39:28 +0200
Subject: [Buildroot] [PATCH v3 00/10] xtensa: add
 -mtext-section-literals to xtensa ABI
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140403213928.657f737f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sun, 30 Mar 2014 21:57:44 +0400, Max Filippov wrote:

> this series is the second part of fixes for building huge sources, like
> wireshark or mplayer: adding trampolines support to binutils allows
> assembling of such files, but with literals placed into separate section
> build fails at the linking step.
> 
> First patch allows building uclibc with -mtext-section-literals, it is
> posted to the uclibc list, but not reviewed/checked in yet.
> Second patch adds -mtext-section-literals flag to xtensa ABI.
> Remaining patches revert -mtext-section-literals additions to individual
> packages.

Series applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
