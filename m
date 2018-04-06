From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 6 Apr 2018 17:03:04 +0200
Subject: [Buildroot] [PATCH] package/llvm: add dependency on shared
 libraries
In-Reply-To: <20180406164141.53fbe576@windsurf>
References: <20180406093958.9392-1-valentin.korenblit@smile.fr>
 <20180406164141.53fbe576@windsurf>
Message-ID: <a05eea9c-d124-84b5-2a75-903f4748f06f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hello Thomas,

On 06/04/2018 16:41, Thomas Petazzoni wrote:
> Hello,
>
> On Fri,  6 Apr 2018 11:39:58 +0200, Valentin Korenblit wrote:
>> llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set
>>
>> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Interestingly, I haven't seen any failure of LLVM related to static
> libraries reported by the autobuilders.

I think llvm should compile correctly but mesa3d has --enable-llvm-shared-libs.
We can disable that option if BR2_STATIC_ONLY.

> Thomas

Valentin
