From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Sep 2014 16:45:28 +0200
Subject: [Buildroot] [PATCH v4 0/4] Improvements to i.MX6 SABRESD boards
 support
In-Reply-To: <20140922153337.13d28023@free-electrons.com>
References: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
 <20140921212519.296ade2a@free-electrons.com>
 <542024B3.9040107@lucaceresoli.net>
 <20140922153337.13d28023@free-electrons.com>
Message-ID: <54203608.5020602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Mon, 22 Sep 2014 15:31:31 +0200, Luca Ceresoli wrote:
>
>> Now that your patch for USB booting in mfgtools mode has been applied,
>> you may simplify the booting procedure documented in
>> https://community.freescale.com/docs/DOC-101842 to remove the tweaks
>> that are not needed anymore.
>>
>> Also, the sentence "there are no files for the sabre sd in the boards
>> folder" is not true anymore.
>
> Also, why don't we have a package to build the host tool
> imx-usb-loader? That would even further simply the instructions.

Sure it would. It's on my todo list, but I haven't started looking at
it yet. It may be be in the next patchset unless I hit any build issues.

-- 
Luca
