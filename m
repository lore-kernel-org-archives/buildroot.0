From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 9 Apr 2014 01:00:51 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-07
In-Reply-To: <20140408063009.EA284100CF4@stock.ovh.net>
References: <20140408063009.EA284100CF4@stock.ovh.net>
Message-ID: <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 8, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-04-07
[...]
>     xtensa |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/959b77fa2c1f13b1958b234803437e09734e882e/

Couldn't reproduce. But I had to disable BR2_PACKAGE_HOST_SAM_BA,
otherwise it refused to build with the following message:

Your Buildroot configuration uses pre-built tools for the x86 architecture,
but your build machine uses the x86-64 architecture without the 32
bits compatibility
library.

-- 
Thanks.
-- Max
