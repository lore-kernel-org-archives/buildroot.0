From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 3 Feb 2016 12:37:10 +0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <CAMo8BfJGPrULkabGgyjS7Wc2myQeQAypOtO80-pNh7BqNSKYcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 22, 2016 at 12:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>       xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/bff7436a800eeea92c0c92bd2846b0f2b31947fd/
>
> /tmp/cchH5TCg.s:23436: Error: value of 38619 too large for field of 2 bytes at 2889
>
> Toolchain problem. Max can you have a look ?

Fixed by https://patchwork.ozlabs.org/patch/577797/

-- 
Thanks.
-- Max
