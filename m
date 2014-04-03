From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:39:05 +0200
Subject: [Buildroot] [PATCH] binutils: backport gas xtensa jump
 trampolines
In-Reply-To: <1395612572-4127-1-git-send-email-jcmvbkbc@gmail.com>
References: <1395612572-4127-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140403213905.48096716@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Mon, 24 Mar 2014 02:09:32 +0400, Max Filippov wrote:
> This fixes compilation of huge source files that have jumps with offsets
> greater than 128 Kbytes, that otherwise fails with such messages:
> 
>   {standard input}:65267: Error: operand 1 of 'j' has out of range value '131089'
>   {standard input}:106879: Error: operand 1 of 'j' has out of range value '4294833951'
> 
> Fixes:
>   http://autobuild.buildroot.net/results/e45/e450d5efc7435035c956bb962d598837648f319d/
> 
> Backported from: a82c7d9030b67a6a76a5403d0e1641f9e42141ac
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
