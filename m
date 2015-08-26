From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 19:26:28 +0200
Subject: [Buildroot] [PATCH v2 1/1] packages/linux-pam: disable when
 using musl
In-Reply-To: <CA+BsyQ4GEO6rT2-exVvJondiMtbP1_5hasdL5fHSEuZGH4z4dg@mail.gmail.com>
References: <1440109933-6123-1-git-send-email-brendanheading@gmail.com>
 <20150826152842.1fb22ddd@free-electrons.com>
 <CA+BsyQ4GEO6rT2-exVvJondiMtbP1_5hasdL5fHSEuZGH4z4dg@mail.gmail.com>
Message-ID: <20150826192628.777d6b52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Wed, 26 Aug 2015 18:06:21 +0100, Brendan Heading wrote:
> Thanks Thomas!
> 
> I have submitted a separate patch set to support linux-pam under musl,
> but I think I'll rebase and re-issue it against the August release
> when it goes out.

Is upstream interested about musl support, and active?

The thing that worries me a bit about the changes required to get
things (in general, not only linux-pam) is that many of those patches
will probably never make their way to the respective upstream
projects.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
