From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Mar 2016 12:57:55 +0300
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_CFLAGS flags to
 configure with --enable-cxx-flags
In-Reply-To: <56E14292.6090209@mind.be>
References: <1433169427-7527-1-git-send-email-jcmvbkbc@gmail.com>
 <20160109220852.GE3444@free.fr> <56DF5EBF.20409@mind.be>
 <CAMo8BfKG3bf9EA+Xi3C2R=8JLZV7EO0o9R_r4depM3dMYPrs+A@mail.gmail.com>
 <56E14292.6090209@mind.be>
Message-ID: <CAMo8BfJ7b2Xio4R8zfequVrChqXBKYA1rdSOWa1X0nc=3mhsjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 10, 2016 at 12:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/10/16 10:37, Max Filippov wrote:
>> AFAICS neither gcc-4.8.x nor gcc-4.9.x propagate CXXFLAGS_FOR_TARGET
>> to CXXFLAGS for builds of libstdc++. gcc-5.x however does.

[...]

>> OTOH since flags propagation is fixed in gcc-5.x maybe backporting
>> that fix is the right thing?
>
>  If the backport is easy, by all means go for it. It's not as if we don't
> have gcc patches already :-)

Ok, let me see if I can figure it out.

-- 
Thanks.
-- Max
