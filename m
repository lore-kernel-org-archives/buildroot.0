From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 13 Feb 2012 09:06:30 +0100
Subject: [Buildroot] [RFC] progress indicator
In-Reply-To: <201202102355.55858.arnout@mind.be>
References: <CAGm1_kt5qPOB2fpWNRREejgp5jMhsM+o0Dq5Po3LHMpySecEjw@mail.gmail.com>
 <201202102355.55858.arnout@mind.be>
Message-ID: <4F38C486.5030208@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.02.2012 23:55, schrieb Arnout Vandecappelle:
> On Thursday 09 February 2012 00:32:42 Yegor Yefremov wrote:
>> What about making a progress indicator, so that user always knows how
>> many packages left to be built? Like Android (AOSP) does during repo
>> sync:
>>
>> Fetching projects:  53% (127/238)  Receiving objects:  22% (290/1289), 195.95 Ki
>> Fetching projects:  54% (129/238)  Receiving objects:  28% (361/1289), 195.95 Ki
>> Fetching projects:  55% (131/238)  Receiving objects:  47% (606/1289), 643.81 Ki
> 
>  crosstool-NG does it as well.
> 
>  However, I don't see how you would do it without major surgery to the 
> infrastructure.

I fear it is inevitable. But if someone has lots of free time, it would be a nice feature. Especially on slow machines it is very nice to know how long will take to build.

Yegor
