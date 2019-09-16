From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 16 Sep 2019 06:17:34 -0700
Subject: [Buildroot] [PATCH 5/5] package/mariadb: fix build error with
 newer cmake
In-Reply-To: <20190915220409.4aa2d5fa@windsurf.home>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
 <20190915193559.8464-5-bluemrp9@gmail.com>
 <20190915220409.4aa2d5fa@windsurf.home>
Message-ID: <fc8917de-f3e6-6f4c-b0b4-8ed7c952fbe4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 9/15/2019 1:04 PM, Thomas Petazzoni wrote:
> Hello Ryan,
>
> On Sun, 15 Sep 2019 12:35:59 -0700
> Ryan Coe <bluemrp9@gmail.com> wrote:
>
>> When using a newer host system cmake to build MariaDB, the following build
>> error occurs:
>>
>> CMake Error at cmake/os/Linux.cmake:29 (STRING):
>> STRING sub-command REPLACE requires at least four arguments.
>> Call Stack (most recent call first):
>> CMakeLists.txt:101 (INCLUDE)
>>
>> CMake Error at cmake/os/Linux.cmake:29 (STRING):
>> STRING sub-command REPLACE requires at least four arguments.
>> Call Stack (most recent call first):
>> CMakeLists.txt:101 (INCLUDE)
>>
>> Fixes: https://bugs.busybox.net/show_bug.cgi?id=11781
>>
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> So, this error occurs with the mariadb version currently in Buildroot.
> So this patch is a fix that is unrelated to the version bumps. It
> should ideally appear *before* the version bumps in the patch series.
> No need to resend, but please confirm that it is independent of the
> version bumps.
That is correct.? It is independent of the version bumps.? I will order 
differently in the future.
> Thanks!
>
> Thomas
