From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 17:24:31 +0100
Subject: [Buildroot] [git commit] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <CANQCQpZY6fS8rojojQx4D3cYWV6ZYWifJoRGZnxiTF3LyWzquw@mail.gmail.com>
 (Matthew Weber's message of "Mon, 29 Jan 2018 09:54:16 -0600")
References: <20180128145128.360AE834A1@busybox.osuosl.org>
 <CANQCQpZY6fS8rojojQx4D3cYWV6ZYWifJoRGZnxiTF3LyWzquw@mail.gmail.com>
Message-ID: <87607k7hvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 > I've internally started to look at build failures across all packages
 > with the following config set in an off-line autobuilder.
 > BR2_OPTIMIZE_1=y
 > BR2_RELRO_FULL=y
 > BR2_FORTIFY_SOURCE_1=y
 > BR2_SSP_STRONG=y

 > So far things are pretty broken but we'll see after I get past the tip
 > of the iceburg how much work it might take to turn on a basic set of
 > these options for regression.

Thanks!

 > I sent some of the package fix-ups as part of this initial series but
 > will probably refresh the series after I get a few more of the big
 > failures worked out.

Yes, the rest of the series is still on my todo list.

-- 
Bye, Peter Korsgaard
