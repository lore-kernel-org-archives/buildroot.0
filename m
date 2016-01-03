From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 21:50:02 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.1
In-Reply-To: <20160102233127.0c6f078c@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 2 Jan 2016 23:31:27 +0100")
References: <1451686709-25501-1-git-send-email-yegorslists@googlemail.com>
 <20160101222835.GD2182@free.fr>
 <20160102233127.0c6f078c@free-electrons.com>
Message-ID: <87fuyeo0at.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Yann, all,
 > On Fri, 1 Jan 2016 23:28:35 +0100, Yann E. MORIN wrote:

 >> I think we want to use upstream locations as much as possible, and only
 >> fallback to alternative locations when there is no upstream, or upstream
 >> is flaky.

 > For Python packages, I actually find it quite practical when PyPi is
 > used. Indeed, instead of having dozens of weird upstream locations and
 > release behavior, you have one consistent way of fetching Python
 > modules. It also makes it easier when reviewing new packages, when
 > looking at package bumps, since you know what to expect from PyPi.

 > So I wouldn't be as strict as you said in terms of not using PyPi.

I agree. I also find it "nice" to use pypi if we can (E.G. if we are
using a release).

-- 
Bye, Peter Korsgaard
