From: Troy Dack <troy@dack.com.au>
Date: Mon, 16 May 2016 12:17:13 +1000
Subject: [Buildroot] [PATCH 0/3] OrangePi Plus: Add support
In-Reply-To: <87d1ongh8f.fsf@dell.be.48ers.dk>
References: <1463268790-1076-1-git-send-email-troy@dack.com.au>
 <87d1ongh8f.fsf@dell.be.48ers.dk>
Message-ID: <7B019F86-2725-4B09-854C-592B85C9FDD1@dack.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 16 May 2016, at 07:10, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>> "Troy" == Troy Dack <troy@dack.com.au> writes:
> 
>> Add support for the OrangePi Plus board.
> 
> In what way does this differ from our existing orangepipc support? Can
> anything be shared between them?

More than likely yes.  Although the OrangePi PC support does rename the
Plus .dts as U-boot doesn?t generate one for the PC yet.

Thanks for the comments on the patches themselves.

The intent was to create a minimal system that could be used either by
putting it onto an SD card, or boot via fel with a usable initrd - without
needing to create an SD card. This was mainly because network support in
mainline on the H3 based OrangePi?s isn?t the best at the moment.

Is it possible to have a generic configuration (say OrangePi-H3) that is
shared and then configs that include the specifics for the OrangePi
Plus/PC etc?

--
	Troy.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 163 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160516/db895350/attachment.asc>
