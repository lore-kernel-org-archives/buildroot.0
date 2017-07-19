From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:14:22 +0200
Subject: [Buildroot] [git commit] libglib2: disable compiler warnings
In-Reply-To: <20170704170700.6316E81E06@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 4 Jul 2017 19:09:40 +0200")
References: <20170704170700.6316E81E06@busybox.osuosl.org>
Message-ID: <87d18wbmc1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f2800ac57cde2cd71df295d33441faae1b30dd3e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > By default, libglib enables some fairly aggressive warnings, treated
 > as errors. In particular, the -Wformat=2 warning triggers a warning
 > due to the return value of the ngettext() macro from uClibc libintl
 > stub not being understood as being potentially a format string.

 > So, before we enable the stub libintl in uClibc, we disable such
 > warnings. A bug will be reported to upstream uClibc to get the actual
 > bug fixed, but disabling compiler warnings treated as errors is anyway
 > a good thing in the context of Buildroot.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
