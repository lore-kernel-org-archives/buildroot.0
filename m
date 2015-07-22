From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 22 Jul 2015 20:04:00 +0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <CAMo8BfJhY+jWUrCjF0nQN2MX49pK+rvivR9CC-+g3P1rZ5fe-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 22, 2015 at 10:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/dd384fe0ef02a4205bea66a4a16ca2062afe53b4/
>
> /tmp/ccHCSuXp.s: Assembler messages:
> /tmp/ccHCSuXp.s:114393: Error: operand 2 of 'l32r' has out of range value '4294705124'
> /tmp/ccHCSuXp.s:114397: Error: operand 2 of 'l32r' has out of range value '4294705068'

That's xtensa gcc problem. Let me try to fix it...

-- 
Thanks.
-- Max
