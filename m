From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 13:21:06 +0100
Subject: [Buildroot] [PATCH 3/4] directfb: expanding the help strings
In-Reply-To: <20130310112701.5ac2f9bc@skate>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-4-git-send-email-c.schoenert@gmail.com>
 <20130310112701.5ac2f9bc@skate>
Message-ID: <513C7AB2.3080000@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 10.03.2013 11:27, schrieb Thomas Petazzoni:
>> +    help
>> +      The Marvell PXA3xx Processor Family is a system-on-chip based
>> +      on XScale? microarchitecture. The PXA3xx processor provide
>> +      high-performance multimedia, low-power capabilities, and rich
>> +      peripheral integration. The PXA3xx Processor Family provide
>> +      enhanced features compared to the PXA27x Processor Family, and
>> +      are the first Marvell applications processors to integrate a
>> +      hardware video accelerator unit.
>> +
>> +      http://www.marvell.com/application-processors/pxa-family/
> 
> Indentation is wrong. It should be one tab for "help" and one tab + two
> spaces for the help text.

Hmm, I have to check my vim settings, sorry.
What about modlines in thees files? This would be helpful and it's just
a one-liner on top of this files.

> In addition to that, I'm not sure the wording of the help text is so
> useful. Something like "This option enables a graphics driver specific
> to the graphics hardware of the Marvell PXA3xx processor family", would
> be a bit more useful.

It have take some times for me to find out what this option is for and
what kind of devices are supported by this option, so at least directfb
is something for the frame buffer the most people know the options are
of course depending on this frame buffer and graphic output related things.
So I think it's worth to explain a little bit more than just 'it's for
the Marvel PXA family foo ...'. But yes, we can discuss about the word
and formulation. ;)
I will rethink about that.

Regards
Carsten
