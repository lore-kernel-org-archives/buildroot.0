From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 16 Jan 2018 23:28:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
In-Reply-To: <jtksiex3i1.ln2@ID-313208.user.individual.net>
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
 <uagqiexfnk.ln2@ID-313208.user.individual.net>
 <6b37de5d-dd14-17a8-44a8-bd9b078c2920@petroprogram.com>
 <jtksiex3i1.ln2@ID-313208.user.individual.net>
Message-ID: <1a1a4349-bb17-6657-1d60-2e8c7891b0e9@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd

I have a little problem. I have ran all the tests now but my
$HOME/tests-unbound is totally empty.
What I am doing wrong?

Regards
Stefan

Bernd Kuhls kirjoitti 14.01.2018 klo 20:42:
> Hi Stefan,
>
> Am Sun, 14 Jan 2018 19:56:00 +0200 schrieb Stefan Fr?berg:
>
>> Uh...47 compiler/platform combinations? Jeeez...that will take ages with
>> my poor comp ...
> Maybe not, test-pkg uses pre-built toolchains, just like the autobuilders.
>
>> Where does that test-pkg script output the build failures?
> $HOME/test-unbound/{name of compiler/platform combo}/logfile
>
> Some errors are thread-related, maybe you need to check for 
> BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of BR2_TOOLCHAIN_HAS_THREADS.
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
