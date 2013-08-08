From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Aug 2013 10:13:43 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAHaz6Edt2E9-Ui=ea7sYe-n7JZRGDpHAYtzo4udGvhPdmSAUA@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
 <CAAHaz6Edt2E9-Ui=ea7sYe-n7JZRGDpHAYtzo4udGvhPdmSAUA@mail.gmail.com>
Message-ID: <CAAXf6LV42u8Hw2O4QejxYUnt-fT6L3q79k4fsJwGVXKGSnPJqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On Thu, Aug 8, 2013 at 9:29 AM, Alexander Lukichev
<alexander.lukichev@gmail.com> wrote:
> Hello Thomas, all,
>
> 2013/8/8 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
>>
>> Hi Simon, Alexander,
>>
>>
>> Current buildroot cannot properly build an AVR32 toolchain with C++
>> support. This problem seems to be present for a while now. Are any of
>> you interested in such C++ support, and do you have time to look into
>> this?
>>
>> If no-one is really interested (or does not have time), here are two
>> suggestions:
>> - we disable the C++ toolchain option for AVR32 and put a comment in
>> kconfig
>> - we leave the C++ toolchain option but put a comment in kconfig
>
>
> I am looking into the problem now and hope that it can be solved. I am OK
> with either option until then. Thanks.

Thanks a lot, it would be great if this can be solved.
Maybe we can learn something from the custom buildroot fork Simon mentioned.

Best regards,
Thomas
