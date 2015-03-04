From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 4 Mar 2015 12:08:06 +0100
Subject: [Buildroot] [PATCH next] cmake: bump version to 3.1.3
In-Reply-To: <CAHkwnC9S4PgWDLm4r70q6Jh1B-FCwezAPQwF9XNzm3FABiL6_A@mail.gmail.com>
References: <1424638604-8244-1-git-send-email-fabio.porcedda@gmail.com>
 <20150304115951.11b49369@free-electrons.com>
 <CAHkwnC9S4PgWDLm4r70q6Jh1B-FCwezAPQwF9XNzm3FABiL6_A@mail.gmail.com>
Message-ID: <CAHkwnC88e99yNeFfKzUc51UVCP2M9a77xHKUuqmYG=eRNuj2Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 4, 2015 at 12:01 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Wed, Mar 4, 2015 at 11:59 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Sun, 22 Feb 2015 21:56:44 +0100, Fabio Porcedda wrote:
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> ---
>>>  package/cmake/cmake.hash | 2 +-
>>>  package/cmake/cmake.mk   | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> This update breaks badly in the autobuilders, see:
>>
>>   http://autobuild.buildroot.org/?reason=host-cmake-3.1.3
>>
>> Apparently, there is a conflict between the host installed lzma, and
>> the built-in lzma library of CMake.
>>
>> Can you have a look ?
>
> I've already a patch for this-
>
> I will send it.

Sent:
http://patchwork.ozlabs.org/patch/446194/

BR
-- 
Fabio Porcedda
