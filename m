From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 03 Nov 2017 07:04:51 +0000
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <b3918167-5b3d-fb4d-19a8-8775228135c0@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
 <20171029072649.GA2899@scaer> <20171029101249.19a91e32@windsurf>
 <6ad5572c-a3a8-2164-9086-ebd3691541a5@gmail.com>
 <20171029181251.GI2899@scaer>
 <d7e6d392-b7d1-7bdc-5048-d88fc6f0ab79@gmail.com>
 <20171030223246.GC3150@scaer>
 <b3918167-5b3d-fb4d-19a8-8775228135c0@gmail.com>
Message-ID: <8008D374-79D0-4B47-847C-B32C7BE7DEC8@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3 November 2017 06:03:32 CET, Florian Fainelli <f.fainelli@gmail.com> wrote:
>OK. So by the same token, I should not expect that rsync operation
>syncing my development tree to output/build/linux-custom to work past
>the initial build/configuration? Right now it does not, I can make as
>many changes as I want in the directory reference from local.mk and
>output/build/linux-custom remains the same as it was the first time it
>got rsync'd, is that really expected?

Sorta, yes.

>I really wonder how you guys are doing serious kernel development with
>buildroot?

'make linux-rebuild' is what you're looking for.

If you need 'oldconfig' to be run, 'make linux-reconfigure' you will want instead.

Regards,
Yann E. MORIN.
Florian, All,
-- 
Sent from my phone. Please excuse my brevity.
