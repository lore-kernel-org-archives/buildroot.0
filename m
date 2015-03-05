From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Mar 2015 23:24:46 +0100
Subject: [Buildroot] [PATCH] mipsel-ctng-linux-uclibc.config: add
	BR2_TOOLCHAIN_EXTERNAL_CXX=y
In-Reply-To: <20150305224513.3865e7ab@free-electrons.com>
References: <1425549917-31392-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150305224513.3865e7ab@free-electrons.com>
Message-ID: <54F8D7AE.50805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 05/03/15 22:45, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Thu, 5 Mar 2015 10:05:17 +0000, Vicente Olivert Riera wrote:
>> This external toolchain has C++ support, so add
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y to the config file.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  .../configs/mipsel-ctng-linux-uclibc.config        |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> Applied, thanks.

thanks to you.

> Next time, can you include some special thing within the [PATCH ...]
> text to indicate that this patch is for buildroot-test and not
> Buildroot? I.e, use:
> 
> 	git format-patch --subject-prefix="PATCH buildroot-test"
> 
> Otherwise it's a bit annoying to differentiate buildroot-test patches
> from other patches in patchwork.

of course, no problem. I have sent many patches to buildroot-test, why
didn't you tell me this before? :-)

Best wishes,
--
Vincent

> Thanks!
> 
> Thomas
> 
