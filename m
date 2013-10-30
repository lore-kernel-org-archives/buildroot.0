From: Chris Zankel <chris@zankel.net>
Date: Tue, 29 Oct 2013 23:00:41 -0700
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029223659.125f8fc1@skate>
References: <20131029204108.5d707d09@skate> <52701682.2040208@zankel.net>
 <20131029211622.62459eef@skate> <52702024.3060303@zankel.net>
 <20131029223659.125f8fc1@skate>
Message-ID: <5270A089.2010102@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for all the comments and explanation.

On 10/29/13, 2:36 PM, Thomas Petazzoni wrote:
> Dear Chris Zankel,
>
> On Tue, 29 Oct 2013 13:52:52 -0700, Chris Zankel wrote:
>> On 10/29/13, 1:16 PM, Thomas Petazzoni wrote:
>>> Are you interested in receiving a daily e-mail with the Xtensa build
>>> failures, if any?
> They are different only in the sense that they contain the failures for
> only a given architecture, and they are sent to the architecture
> maintainer directly rather than to the list. This allows you to look
> only at "your" failures rather than the entire set of failures, and
> ensure that you see the e-mail even if you don't read the entire
> mailing list traffic.
Great! Sign me up then :-)
> The only option that I can see is to introduce fake 'uClibc-xtensa'
> version, which downloads a specific git commit. This way, we are sure
> to have the same version between builds, and you can update this
> version by sending a patch to Buildroot whenever needed.
>
> Thoughts?
Sounds like a plan. Give me a few days, though, a lot going on right now.

Thanks,
-Chris
