From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 22:27:13 +0100
Subject: [Buildroot] [PATCH v2] icu: Doesn't work on ARC yet
In-Reply-To: <1384186253-5968-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Mon, 11 Nov 2013 17:10:53 +0100")
References: <1384186253-5968-1-git-send-email-mjonker@synopsys.com>
Message-ID: <87ppq6634e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

> icu depends on __sync_sub_and_fetch and other atomic primitives that
> don't exist in the ARC toolchain yet.

> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
> v2:
>  Added !arc dependency to comment line
>  Propagated dependency to icu's reverse dependencies, except for webkit
>   (webkit already cannot be selected for ARC)

Committed with the changes pointed out by Thomas and the dependency
added for the beecrypt comment as well, thanks.

-- 
Bye, Peter Korsgaard
