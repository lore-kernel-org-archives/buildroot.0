From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:30:17 +0200
Subject: [Buildroot] [PATCH] gcc: add gcc 5.2.0
In-Reply-To: <55A81E9E.8000103@zacarias.com.ar>
References: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>
 <20150716225639.14772165@free-electrons.com>
 <55A81B35.2040200@zacarias.com.ar>
 <20150716231024.656693cb@free-electrons.com>
 <55A81E9E.8000103@zacarias.com.ar>
Message-ID: <20150716233017.383ce16b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jul 2015 18:14:06 -0300, Gustavo Zacarias wrote:

> I was going to go for what you've said until i saw the size delta and 
> issue, and opted for this approach, but i'm open to votes/suggestions as 
> well.
> Maybe skipping 5.2.0 for the time?

Yes, I think skipping 5.2.0 for the time is the best option. As I said,
it anyway doesn't make much sense to have a compiler that doesn't even
build a kernel properly for a major architecture like ARM.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
