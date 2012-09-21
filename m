From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 11:26:54 -0300
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <877grn790t.fsf@macbook.be.48ers.dk>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
 <505C5180.10105@zacarias.com.ar> <505C597E.8020306@mind.be>
 <877grn790t.fsf@macbook.be.48ers.dk>
Message-ID: <505C792E.5000509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 11:20, Peter Korsgaard wrote:

> That's an option, but it's fairly slow to build (mainly because of the
> embedded glib), so people might not like it (especially if using an
> external toolchain). Perhaps it would be better to move to pkgconf
> instead then (I think Gentoo uses it)?
> 
> https://github.com/pkgconf/pkgconf

It's not a default in Gentoo yet, though it's available.
Anybody run some tests switching to it?
Regards.
