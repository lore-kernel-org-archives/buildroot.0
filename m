From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 15 Sep 2019 23:16:33 +0200
Subject: [Buildroot] Reproducible autobuild result issue
In-Reply-To: <20190915212200.43d16b0b@windsurf.home>
References: <20190915212200.43d16b0b@windsurf.home>
Message-ID: <bd60b1f7-3f07-0b30-f6b6-16be74ac2a9e@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Atharva, Thomas,

Le 15/09/2019 ? 21:22, Thomas Petazzoni a ?crit?:
> Hello Atharva,
> 
> I have not followed closely all your latest patches on reproducible
> testing with the autobuilders, but at least in the current setup, there
> is a bug:
> 
>   http://autobuild.buildroot.net/results/7b4/7b40753dc8623310e05ecfc92de5582eb767beea//diffoscope-results.json
> 
> contains the output of "cmp". I guess it occurred on a machine that
> does not have diffoscope installed. But in any case, it is very wrong
> to have the result of "cmp" in a file named diffoscope-results.json,
> no ?
> 
> Romain: this happened on your machine. Which version of the
> autobuild-run script are you using a the moment ?

Le script utilise un version plut?t r?cente:
93e9b3fdb0acffad11696ee14f5a41875653821d

Version of diffoscope on this machine:
$ diffoscope --version
diffoscope 111

Best regards,
Romain

> 
> Best regards,
> 
> Thomas Petazzoni
> 
