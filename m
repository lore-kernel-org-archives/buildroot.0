From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Sep 2009 13:21:57 +0200
Subject: [Buildroot] coreutils build failing
In-Reply-To: <4AAA142E.2060107@rodgers.sdcoxmail.com> (Stephen Rodgers's
	message of "Fri\, 11 Sep 2009 02\:11\:10 -0700")
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>
	<877hwbmi5k.fsf@macbook.be.48ers.dk>
	<4AA5300B.3060804@rodgers.sdcoxmail.com>
	<87r5ui63d1.fsf@macbook.be.48ers.dk>
	<4AA5529F.7050906@rodgers.sdcoxmail.com>
	<8763bu5twt.fsf@macbook.be.48ers.dk>
	<4AA58BB1.50906@rodgers.sdcoxmail.com>
	<87r5ugyywf.fsf@macbook.be.48ers.dk>
	<4AA87826.5020506@rodgers.sdcoxmail.com>
	<87ocpjw95j.fsf@macbook.be.48ers.dk>
	<4AAA142E.2060107@rodgers.sdcoxmail.com>
Message-ID: <87eiqdvi96.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:

Hi,

 Stephen> If I search config.log in build_i696/coreutils, I see
 Stephen> gl_cv_func_rename_trailing_slash_bug=yes on line 75574. Snippet below:

 Stephen> gl_cv_func_re_compile_pattern_working=no
 Stephen> gl_cv_func_rename_dest_exists_bug=no
 Stephen> gl_cv_func_rename_trailing_dest_slash_bug=yes
 Stephen> gl_cv_func_rename_trailing_slash_bug=yes
 Stephen> gl_cv_func_rmdir_errno_not_empty=ENOTEMPTY
 Stephen> gl_cv_func_select_supports0='guessing yes'

Hmm, it worked here. Is this with a complete clean rebuild? (rm -rf
*build_*; make)

-- 
Bye, Peter Korsgaard
