From: Stephen Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Fri, 11 Sep 2009 07:16:36 -0700
Subject: [Buildroot] coreutils build failing
In-Reply-To: <87eiqdvi96.fsf@macbook.be.48ers.dk>
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>	<877hwbmi5k.fsf@macbook.be.48ers.dk>	<4AA5300B.3060804@rodgers.sdcoxmail.com>	<87r5ui63d1.fsf@macbook.be.48ers.dk>	<4AA5529F.7050906@rodgers.sdcoxmail.com>	<8763bu5twt.fsf@macbook.be.48ers.dk>	<4AA58BB1.50906@rodgers.sdcoxmail.com>	<87r5ugyywf.fsf@macbook.be.48ers.dk>	<4AA87826.5020506@rodgers.sdcoxmail.com>	<87ocpjw95j.fsf@macbook.be.48ers.dk>	<4AAA142E.2060107@rodgers.sdcoxmail.com>
	<87eiqdvi96.fsf@macbook.be.48ers.dk>
Message-ID: <4AAA5BC4.8050602@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:
> 
> Hi,
> 
>  Stephen> If I search config.log in build_i696/coreutils, I see
>  Stephen> gl_cv_func_rename_trailing_slash_bug=yes on line 75574. Snippet below:
> 
>  Stephen> gl_cv_func_re_compile_pattern_working=no
>  Stephen> gl_cv_func_rename_dest_exists_bug=no
>  Stephen> gl_cv_func_rename_trailing_dest_slash_bug=yes
>  Stephen> gl_cv_func_rename_trailing_slash_bug=yes
>  Stephen> gl_cv_func_rmdir_errno_not_empty=ENOTEMPTY
>  Stephen> gl_cv_func_select_supports0='guessing yes'
> 
> Hmm, it worked here. Is this with a complete clean rebuild? (rm -rf
> *build_*; make)
> 

Yes, it was a complete rebuild with all build dirs. deleted.

Steve.
