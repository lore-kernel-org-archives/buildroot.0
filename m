From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 14:59:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] automake: fix unescaped left brace
	warning patch.
In-Reply-To: <1499072958.1626.5.camel@embedded.rocks> (=?utf-8?Q?=22J?=
 =?utf-8?Q?=C3=B6rg?= Krause"'s message
 of "Mon, 03 Jul 2017 11:09:18 +0200")
References: <20170306132359.21768-1-aduskett@codeblue.com>
 <20170320214543.02c3461c@free-electrons.com>
 <1499072958.1626.5.camel@embedded.rocks>
Message-ID: <87a84l8ymo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> I've applied. However, you should format the patches of projects
 >> managed with Git using "git format-patch". So the automake patch
 >> should
 >> have been Git formatted. I've fixed that before applying.

 > We should apply the patch to the 2017.02.x branch, too. Perl 5.26 is
 > treating the warning as an error. This patch fixes building alsa-lib
 > for me on the 2017.02.x branch.

Ok - Committed to 2017.02.x, thanks!

-- 
Bye, Peter Korsgaard
