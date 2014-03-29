From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 29 Mar 2014 10:39:01 +0100
Subject: [Buildroot] [PATCH 2/2] slang: add ncurses optional dependency
In-Reply-To: <87vbuyg0r0.fsf@dell.be.48ers.dk>
References: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>	<1395961593-9826-2-git-send-email-romain.naour@openwide.fr>
 <87vbuyg0r0.fsf@dell.be.48ers.dk>
Message-ID: <533694B5.30606@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 28/03/2014 09:56, Peter Korsgaard a ?crit :
>>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:
>   > Ncurses check need to be disabled if ncurses package is not
>   > selected.
>   > If we don't do that, host's ncurses5-config may be used by
>   > configure script.
>
>   > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>
> Committed, thanks.
>
>   > Note: others optional dependencies may be missing
>   > (pcre oniguruma png z iconv)
>
> Care to cook up a patch for those?
>
Sorry, I had notime to rework on this patch yesterday.
In the meantime Gustavo Zacarias added a patch for slsh and
added the missing dependencies.

Also, my patch for slang has broken the newt package.
newt could not find the slang library.
http://autobuild.buildroot.net/results/553/5533328ec987f12d0b3dd81c430e960d3dc50503/build-end.log

Thanks to Gustavo the problem is gone.

Best regards,
Romain
