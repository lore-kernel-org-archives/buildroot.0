From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Jun 2014 19:21:31 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.10
In-Reply-To: <87bnu9r5yu.fsf@dell.be.48ers.dk>
References: <1401833214-31074-1-git-send-email-gustavo@zacarias.com.ar>
 <87bnu9r5yu.fsf@dell.be.48ers.dk>
Message-ID: <538E4A6B.7030807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/2014 07:19 PM, Peter Korsgaard wrote:

>  > +comment "e4defrag needs an (e)glibc toolchain"
>  > +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> 
> What about musl? To match the comment we should use
> !BR2_TOOLCHAIN_USES_GLIBC instead.

Musl should work, but the comments need to be updated across the tree on
a case-by-case basis for other packages as well.
Actually some uclibc snapshots might work, but that depends on timestamp.
Regards.
