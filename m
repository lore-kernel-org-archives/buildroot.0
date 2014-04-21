From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 13:55:42 +0200
Subject: [Buildroot] [PATCH 1/2] smack: new package.
In-Reply-To: <20140421115606.GA4082@milhouse>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140421121901.743513ef@skate> <20140421115606.GA4082@milhouse>
Message-ID: <20140421135542.26258821@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 21 Apr 2014 13:56:07 +0200, Eric Le Bihan wrote:

> Thanks for the polishing! Wouldn't it be useful to add a stanza in the
> docs/manual/contribute.txt about performing some compliancy tests using these
> two configurations before submitting new packages? Are there any other
> criteria that could fit compliancy tests/checklist?

While reviewing these packages, I was indeed thinking of writing a
"package addition check list" for the manual. But I'm wondering if this
wouldn't replicate quite a lot of informations already in the manual,
though it's true the idea of testing with some specific toolchain
configurations isn't written anywhere.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
