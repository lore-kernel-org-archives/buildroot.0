From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:32:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/ply: needs headers >= 4.14
In-Reply-To: <20210126191608.2183070-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Jan 2021 20:16:08 +0100")
References: <20210126191608.2183070-1-fontaine.fabrice@gmail.com>
Message-ID: <87ft2itxj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > ply uses BPF_JLT is available only since kernel 4.14 with:
 > https://github.com/torvalds/linux/commit/92b31a9af73b3a3fc801899335d6c47966351830

 > Fixes:
 >  - http://autobuild.buildroot.org/results/632187ceb7ca5e2dc5a3e5185860ddb874b4274c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
