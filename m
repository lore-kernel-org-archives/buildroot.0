From: Martin Peevski <martin@ronetix.at>
Date: Wed, 10 Oct 2012 17:52:01 +0300
Subject: [Buildroot] ALSA don't work
In-Reply-To: <50740F31.5060502@petroprogram.com>
References: <506EF1E6.2090902@ronetix.at> <506EF5DD.4020307@petroprogram.com>
 <506EFDEE.5020307@ronetix.at> <506F18F6.5010506@petroprogram.com>
 <50703E2A.5060702@ronetix.at> <50704D34.2070002@petroprogram.com>
 <50716DA7.4030200@ronetix.at> <50716F47.1@ronetix.at>
 <5071A4C8.9040407@petroprogram.com> <5072BC98.6070707@ronetix.at>
 <5072D9D0.4030800@petroprogram.com> <5072E581.1000506@ronetix.at>
 <5072E763.7010508@petroprogram.com> <507401F7.60905@ronetix.at>
 <50740F31.5060502@petroprogram.com>
Message-ID: <50758B91.7060000@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/12 14:49, Stefan Fr?berg wrote:
> 9.10.2012 13:52, Martin Peevski kirjoitti:
>> On 08/10/12 17:46, Stefan Fr?berg wrote:
>>>>> Give co
>>
>>
>> Now I add all ALSA packages as you are did it in the attached file but
>> still no sound. That's the answer from the console:
>>
>> # alsactl init
>> Found hardware: "WM8731" "" "" "" ""
>> Hardware is initialized using a generic method
> And alsactl still gives only chip name and nothing more.
>
> What about your comparison of working system and buildroot one ?
> Any differences ?
>
> Stefan

Hi, my boss want to work on another topics now. I leave the ALSA not 
working for the moment. If I make something in the future will tell you.
Thanks for the big help!
Martin

>
>> #
>> # speaker-test -t wav -c2
>>
>> speaker-test 1.0.25
>>
>> Playback device is default
>> Stream parameters are 48000Hz, S16_LE, 2 channels
>> WAV file(s)
>> Rate set to 48000Hz (requested 48000Hz)
>> Buffer size range from 16 to 8192
>> Period size range from 8 to 2048
>> Using max buffer size 8192
>> Periods = 4
>> was set period_size = 2048
>> was set buffer_size = 8192
>>   0 - Front Left
>> Write error: -5,Input/output error
>> xrun_recovery failed: -5,Input/output error
>> Transfer failed: Operation not permitted
