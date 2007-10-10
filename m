From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 10 Oct 2007 21:59:58 +0200
Subject: [Buildroot] Problems building toolchain
In-Reply-To: <470C7CA5.9000103@sfktech.com>
References: <470B9BAB.3050407@sfktech.com> <20071009163451.GB16889@aon.at>
	<470C7CA5.9000103@sfktech.com>
Message-ID: <20071010195957.GZ20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 10, 2007 at 09:17:57AM +0200, Kim Str?ger wrote:
> Bernhard Fischer wrote:
>> On Tue, Oct 09, 2007 at 05:18:03PM +0200, Kim Str?ger wrote:
>>> How do I get passed this point ?
>>>     
>>
>> What did you specify as your target CPU and other settings? If in doubt
>> attach your toplevel .config, please.
>>
>> Also please do
>> $ make V=1
>> and show me the arguments used for the command that fails.

> BR2_arm7tdmi=y

Sounds like this is coming from uClibc.
