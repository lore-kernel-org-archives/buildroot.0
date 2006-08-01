From: Marc Lindahl <marc@bowery.com>
Date: Mon, 31 Jul 2006 20:15:25 -0400
Subject: [Buildroot] base busybox version for buildroot?
In-Reply-To: <200607312012.48613.rob@landley.net>
References: <bf61e79a0607270644g7beea2b2p67890c1a88528436@mail.gmail.com>
	<20060727183737.GB23639@codepoet.org>
	<200607312012.48613.rob@landley.net>
Message-ID: <9aa77677255835d7244f93dc4ed4b2f9@bowery.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Jul 31, 2006, at 8:12 PM, Rob Landley wrote:

> On Thursday 27 July 2006 2:37 pm, Erik Andersen wrote:
>> On Thu Jul 27, 2006 at 09:44:42AM -0400, Drew Cohan wrote:
>>> Hi,
>>>
>>> Is the base busybox version for buildroot is now 1.2.0, instead of
>>> 1.1.3?  Is there a buildroot config somewhere that determines which
>>> version of busybox is used, or is it just based on the date of the
>>> buildroot package (builds after 30 June 2006 use busybox 1.2.0)?
>>> There seems to have been a file size change recently, just curious
>>> what that might have been:
>>>
>>> buildroot-20060710.t..> 10-Jul-2006 00:17  3.8M
>>> buildroot-20060711.t..> 11-Jul-2006 00:17  4.3M
>>
>> It probably makes sense at this point to have configurable
>> busybox versions (as with gcc and binuitls) with a specific
>> default config for each.
>
> I still think the latest release version is all you need, but what do I
> know? :)
>

If you're building an embedded system you definitely want control over 
the version... so you can freeze it once everything works, and ship it! 
:)

just my $0.002

Marc
