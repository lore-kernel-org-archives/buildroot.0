From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2014 22:14:34 +0200
Subject: [Buildroot] [PATCH 1/2] smack: new package.
In-Reply-To: <349b40e5-c2f3-4b82-97dd-5f18e5638d24@email.android.com> (Thomas
 De Schampheleire's message of "Mon, 21 Apr 2014 14:49:00 +0200")
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140421121901.743513ef@skate> <20140421115606.GA4082@milhouse>
 <20140421135542.26258821@skate>
 <349b40e5-c2f3-4b82-97dd-5f18e5638d24@email.android.com>
Message-ID: <87ha5i1o45.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> While reviewing these packages, I was indeed thinking of writing a
 >> "package addition check list" for the manual. But I'm wondering if this
 >> wouldn't replicate quite a lot of informations already in the manual,
 >> though it's true the idea of testing with some specific toolchain
 >> configurations isn't written anywhere.

 > I certainly think a checklist would be a good addition to the
 > manual. The checklist would not contain details, but only references
 > to other parts of the manual.

 > Adding a list of toolchain configurations to test packages with is
 > also on my todo list but I haven't gotten around these improvements
 > yet...

Perhaps we need something like checkpatch.pl to test a package with the
various toolchain combinations?

-- 
Bye, Peter Korsgaard
