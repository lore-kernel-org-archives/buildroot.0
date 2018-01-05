From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Fri, 5 Jan 2018 22:34:14 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: Fix toolchain to create
 proper builds for MIPS XBurst targets
In-Reply-To: <20180105212715.5e50d391@windsurf>
References: <1515170305-25742-1-git-send-email-johannes.schmitz1@gmail.com>
 <20180105212715.5e50d391@windsurf>
Message-ID: <CAMbDF3KKpBcAw-03Ek3MgsLSKwP9hbuuz5KkVPBF6BSZfG-pfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.01.2018 21:27 schrieb "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com>:

Hello,

This is PATCH 2/2, we haven't received PATCH 1/2 in the mailing list.
Where is it?

On Fri,  5 Jan 2018 17:38:25 +0100, Johannes Schmitz wrote:
> This patch is need for example for ci20, -mfused-madd is deprecated, we
> need to use -ffp-contract instead.
>
> This is basically a resubmission of
> https://patchwork.ozlabs.org/patch/800406/
>
> Please consider accepting the original patch, otherwise buildroot is
> basically broken for ci20 and similar platforms.

Is your patch a resubmission, or an additional patch ? You say it's a
resubmission, and then the next paragraph you say we should also apply
the original patch.


It was not my own patch but I want to help bringing it up again because the
original author complained that so far it hasn't been accepted. He
recommended me to try it and see if it helps and it did help.

Also, the commit log should explain since which gcc version is
-mfused-madd deprecated, and since which gcc version is -ffp-contract
available.


I don't know this, my knowledge is incomplete in this area. I just manually
applied the original patch. What can we do together to get this patch to an
acceptable state?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180105/bd632d0c/attachment.html>
