From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon, 10 Dec 2012 23:14:06 +0100
Subject: [Buildroot] [git commit] package/crosstool-ng: bumpimg default
 GCC version to 4.6.3
In-Reply-To: <87ehiytfcn.fsf@dell.be.48ers.dk>
References: <20121209203933.44D7B9A158@busybox.osuosl.org>
 <20121210100945.0ccfbe69@skate> <87ehiytfcn.fsf@dell.be.48ers.dk>
Message-ID: <50C65EAE.6040800@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,
hello Thomas,

Am 10.12.2012 10:40, schrieb Peter Korsgaard:
>  Thomas> The recent updates to the crosstool-ng configs is apparently breaking
>  Thomas> the build:
> 
>  Thomas>   http://autobuild.buildroot.org/results/b99c757884d14bbe8893900824763f63dd13f5dc/build-end.log
> 
> Yes, that looks related (but not exactly the same) as the ppl issues
> with gcc 4.7+ mentioned yesterday.
> 
> Yann mentioned on IRC that he had a ppl fix pending.

As far as I can see in the (complete) log the toolchain was building
PPL 0.10.2 but 0.11 is later expected. If possible I can test one more
change to the crosstool-ng configs later. :/

-- 
Regards
Carsten
