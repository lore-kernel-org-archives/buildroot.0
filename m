From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 19:59:26 +0200
Subject: [Buildroot] [PATCH v2 2/5] support/scripts/graph-depends: use
 colors instead of colours
In-Reply-To: <20180331163543.6278-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 31 Mar 2018 18:35:40 +0200")
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
 <20180331163543.6278-3-thomas.petazzoni@bootlin.com>
Message-ID: <878ta6reo1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The graph-depends was not very consistent in colors vs. colours: some
 > parts were using colours, some parts were using colors.

 > Let's settle on the US spelling, colors.

 > This change the user-visble option --colours to --colors, but it is
 > unlikely that a lot of users customize the colors through
 > BR2_GRAPH_DEPS_OPTS, so this user interface change is considered
 > reasonable.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
