From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 30 Oct 2020 09:47:42 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/3=5D_package/libabseil-cpp=3A_e?=
 =?utf-8?q?nforce_C++11?=
In-Reply-To: <20201030091522.53c77303@windsurf.home>
Message-ID: <52-5f9bd300-7-71e23380@170443389>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 
On Friday, October 30, 2020 09:15 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 
 
> 
> In fact, let's turn this around: if abseil uses C++11 features, then it
> should by itself pass -std=c++11 to the compiler, by setting the
> appropriate CXX_STANDARD in its CMakeLists.txt. There is no reason
> Buildroot should have to help here. So isn't an abseil CMakeLists.txt
> fix (submitted upstream) more appropriate here ?
> 

Actually this was in abseil and they removed it intentionally in [0].
So I don't think they might have interest in picking up a patch that would reintroduce that...

Regards,
Michael

[0] https://github.com/abseil/abseil-cpp/commit/c6954897f7ece5011f0126db9117361dc1a6ff36#
