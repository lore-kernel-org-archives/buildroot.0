From: bao bui <buiqbao@gmail.com>
Date: Tue, 15 Mar 2011 13:41:34 +0700
Subject: [Buildroot] [gs-devel] ghost script warning with fonts
In-Reply-To: <5.1.0.14.2.20110314130522.03adfe98@pop.gmail.com>
References: <5.1.0.14.2.20110314130522.03adfe98@pop.gmail.com>
Message-ID: <AANLkTimsQL4-8Ebxr3xMCeD29moSSdZCF_p8hi4dSPDc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Ken,

Is there another solution such as add more fonts for ghost script. This is
an embedded device, and I can not remake the PDF file. It just print out
every file I put in

BAO

On Mon, Mar 14, 2011 at 8:05 PM, Ken Sharp <ken.sharp@artifex.com> wrote:

> At 05:21 14/03/2011 -0700, bao bui wrote:
>
>
>  When printing using ghost script, I got this warning in the
>> /var/log/cups/error_log:
>>
>> **** Warning: Fonts with Subtype = /TrueType should be embedded.
>> D [04/Sep/2005:17:30:10 -0600] [Job 5] But RockwellCondensed,BoldItalic is
>> not embedded.
>>
>
> [snip]
>
>
>  How can I get rid of those warning?
>>
>
> Remake the PDF file with the required fonts embedded.
>
>            Ken
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110315/7dda3b2f/attachment.html>
