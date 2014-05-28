From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 28 May 2014 21:09:48 +0200
Subject: [Buildroot] [PATCH 07/14] pkg-cmake.mk: set additional
 variables in toolchainfile.cmake
In-Reply-To: <53599337.70302@mind.be>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-8-git-send-email-s.martin49@gmail.com>
 <53599337.70302@mind.be>
Message-ID: <CAHXCMML-qbN6u-z9ABg42Wk_K5Sb2N4rjrryXLxep5dnvrREfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On Fri, Apr 25, 2014 at 12:41 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/04/14 00:48, Samuel Martin wrote:
>> Set binutils programs CMake variables in the toolchainfile.cmake file.
>>
>> This variables must be cached, otherwise they are wrongly set, resulting
>> empty, which will make the builds fail.
>
>  Can you point to a specific build failure?

None.
It is just a use-case I have, but I can workaround some other way.
I'll drop this patch.

Regards,

-- 
Samuel
