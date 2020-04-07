From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 7 Apr 2020 21:08:29 +0200
Subject: [Buildroot] [PATCH] package/gcc: bump to version 9.3.0
In-Reply-To: <87sghfrchc.fsf@dell.be.48ers.dk>
References: <20200315161846.5827-1-romain.naour@smile.fr>
 <87sghfrchc.fsf@dell.be.48ers.dk>
Message-ID: <961195de-36c5-a8a5-a231-69ea4544c6fd@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 07/04/2020 ? 09:17, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
> 
>  > Remove upstream patch [1]
>  > Rebase and rename 0002-xtensa-fix-PR-target-91880.patch
>  > and 0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
> 
>  > Tested using gitlab with Qemu runtime testing series [2] [3].
> 
>  > [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=2e1e7ad18e121663082525a872f0d6fb32db4535
>  > [2] https://gitlab.com/kubu93/buildroot/pipelines/125828238
>  > [3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088
> 
>  > See:
>  > https://gcc.gnu.org/pipermail/gcc-announce/2020/000161.html
> 
>  > Signed-off-by: Romain Naour <romain.naour@smile.fr>
> 
> Committed to 2020.02.x, thanks.
> 
> Given that they are just about to go EOL (and we didn't backport gcc
> 7.5.0) I have NOT committed to 2019.02.x and 2019.11.x.
> 

Ok for me, same for gcc 8.4.0.

Best regards,
Romain
