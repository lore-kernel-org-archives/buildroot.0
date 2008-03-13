From: John Voltz <john.voltz@gmail.com>
Date: Thu, 13 Mar 2008 16:39:41 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
In-Reply-To: <87myp24dsz.fsf@macbook.be.48ers.dk>
References: <20080313171042.D38B5120156@busybox.net>
	<87prty5vpd.fsf@macbook.be.48ers.dk>
	<46a136670803131128v593e8652geac1b0ca62aaa3d4@mail.gmail.com>
	<87myp24dsz.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670803131339u6163d4a2w787ec0d0ed6769a5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Geez, I guess it does.
John

On Thu, Mar 13, 2008 at 3:35 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "John" == John Voltz <john.voltz@gmail.com> writes:
>
>  John>     What's the purpose of cat?
>
>
>
>  John> It prevents the echo from overwriting the last echo, if there
>  John> are multiple patches.
>
> Huh? Why wouldn't echo ${i} >> ${target_dir}/.patch... work?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080313/9a5bd651/attachment.htm 
