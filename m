From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Tue, 10 Nov 2015 12:21:31 -0700
Subject: [Buildroot] Building new package with "make <pkg>"
In-Reply-To: <564239FF.3030602@cmlab.biz>
References: <564239FF.3030602@cmlab.biz>
Message-ID: <564243BB.6070300@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/2015 11:39 AM, David Van Arnem wrote:
> Hi all,
>
> I see from the top-level Makefile "help" that I should be able to run
> "make <pkg>" to build only a target package and its dependencies in
> Buildroot.  I added a new package to Buildroot, but when I run the make
> command to build only it, the tools seem to be doing a complete build
> (kernel, all target packages, filesystem, etc).  What do I need to do to
> be able to build the package by itself?

Nevermind, I wasn't waiting long enough...the tools were building GCC 
for the target architecture and then the package built correctly.  Sorry 
for the noise.

David
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Thanks,
David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2416 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151110/6f8b5948/attachment.p7s>
