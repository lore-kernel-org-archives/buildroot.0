From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 09:27:09 -0300
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C597E.8020306@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
 <505C5180.10105@zacarias.com.ar> <505C597E.8020306@mind.be>
Message-ID: <505C5D1D.8060300@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 09:11, Arnout Vandecappelle wrote:
>> host-pkg-config almost always present
> 
>  Maybe we should make that _always_ present, and add host-pkg-config to
> the toolchain build...  It is more or less part of the toolchain, and it
> doesn't hurt to build it if it's not needed.

Possible, host variant doesn't use anything that we don't have around
and it's pretty straightforward.
Also adding a helper script for new packages would be neat, at least to
check for the usual suspects, with some magic grepping of the unpacked
tarballs.
Regards.
