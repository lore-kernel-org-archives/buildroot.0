From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 09:20:42 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <1426708866.1395.8.camel@embedded.rocks>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
Message-ID: <20150319092042.2875d9e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Wed, 18 Mar 2015 21:01:06 +0100, J?rg Krause wrote:

> Are there any guidelines for reviewing?

Not really. Just pick patches touching things you are a bit comfortable
with, give them some testing, and do some comments if needed. On the
other hand, if you think the patch is fine, simply reply with a
Reviewed-by tag.

Of course, reviewing simple package bumps or hash file additions is not
very useful, since I tend to apply such patches quickly: there is not
much potential trouble with such patches.

> It's a pitty that GSoC did not accepted Buildroot this year. The
> testing scripts would be a nice feature.

Yes, it is a pitty, but hopefully someone will pick up the task and
work on improving our QA tooling :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
