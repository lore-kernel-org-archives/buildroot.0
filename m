From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 14:37:40 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CANQCQpbp4Eu7V=FMj_azMoR22w=QScoVL69ToHKhYkU-_FLFbQ@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
 <20171101104532.43dcd164@windsurf>
 <CANQCQpbp4Eu7V=FMj_azMoR22w=QScoVL69ToHKhYkU-_FLFbQ@mail.gmail.com>
Message-ID: <20171101143740.6d37c5cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Nov 2017 08:24:54 -0500, Matthew Weber wrote:

> I'll work on pulling in this patchset from upstream.  It looks like it
> was reviewed but missed the merge window for 2017.11.
> https://lists.denx.de/pipermail/u-boot/2017-October/309560.html

The patch "pylibfdt: move pylibfdt to scripts/dtc/pylibfdt and refactor
makefile" is really large, I'm not sure we want this one in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
