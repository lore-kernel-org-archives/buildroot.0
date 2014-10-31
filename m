From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 31 Oct 2014 14:43:36 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-30
In-Reply-To: <20141031073016.162E2100B71@stock.ovh.net>
References: <20141031073016.162E2100B71@stock.ovh.net>
Message-ID: <CAMo8BfLGf838g4EX_BXSF7M8U8PLrH+Q5ZD16JiMrGS9WXwcHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 31, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-10-30
>       xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/1935c5d3b1c987c0ae1c2faacf8139d99119f965/

Wants dlfcn.h, but the config has BR2_PREFER_STATIC_LIB=y.
Looks like python should depend on !BR2_PREFER_STATIC_LIB?

-- 
Thanks.
-- Max
