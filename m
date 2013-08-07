From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 20:20:31 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
Message-ID: <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 7, 2013 at 6:01 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
>
> On Wed, Aug 7, 2013 at 5:20 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Can you try to see if the same configuration was building in the
>> 2013.05, to see if the problem is a consequence of the new internal
>> toolchain backend or not?
>
> I will, and let you know the results.

This also failed in 2013.05, and 2013.02. I can continue down the
line, but it seems that not many people need C++ support on AVR32? I
can

>
> Best regards,
> Thomas
