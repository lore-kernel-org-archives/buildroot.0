From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 20 Feb 2013 16:17:59 +0100
Subject: [Buildroot] Using external toolchain wrapper outside of
	buildroot
In-Reply-To: <BF980CD5635D994FA25831A4A9C113BF1328583EBE@THHS2E12BE9X.hostedservice2.net>
References: <BF980CD5635D994FA25831A4A9C113BF1328583EBE@THHS2E12BE9X.hostedservice2.net>
Message-ID: <CAHQn0khK6LmkqTbKBPwp9hSUzB-Fvr5hx8E13aRfBTk7rq48OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Greg

On Fri, Feb 15, 2013 at 12:22 PM, Greg Beresford
<greg.beresford@zbdsolutions.com> wrote:
> I've attached a patch with a fix below which calculates absbasedir from /proc/self/exe. (I don't know of any other way of reliably getting the path to the current executable.) My C is rusty though, so it might need to be fixed up before it's applied. (Was there a reason for avoiding the basename and dirname functions from libgen.h?)

I've tested it and it solved my problems with the external toolchain.
I can't find any obvious C flaws either, so for what it's worth:

Acked-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
