From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 12:05:31 +0200
Subject: [Buildroot] [PATCH v2 11/13] board/boundarydevices: rework and
 update u-boot scripts
In-Reply-To: <20150526095412.GP2260@tarshish>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432628382-16799-12-git-send-email-gary.bisson@boundarydevices.com>
 <20150526095412.GP2260@tarshish>
Message-ID: <CAAMH-yvw-DmMDQ8wp+FvPYA-b9YA9aBUUZb4pqfG9c0LZ6h+rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Tue, May 26, 2015 at 11:54 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Garry,
>
> On Tue, May 26, 2015 at 10:19:40AM +0200, Gary Bisson wrote:
>> The rework consists of replacing the binaries by their text file
>> equivalent and generate the binaries from the post-build.sh script.
>
> [...]
>
>>  board/boundarydevices/nitrogen6x/6x_bootscript     | Bin 3207 -> 0 bytes
>>  board/boundarydevices/nitrogen6x/6x_bootscript.txt | 186 +++++++++++++++++++++
>>  .../nitrogen6x/{6x_upgrade => 6x_upgrade.txt}      | Bin 1465 -> 1393 bytes
>
> So why do you still add the binary files, then?

Actually that is weird that git recognizes it as a renaming because I
removed the binary and added the ASCII file instead.

Anyway, if you do a 'file' on 6x_upgrade.txt it will appear as an
"ASCII text" just like 6x_bootscript.txt and further modifications
won't appear as binary diff.

Regards,
Gary
