From: Damjan Marion <damjan.marion@gmail.com>
Date: Mon, 28 Nov 2016 11:50:22 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <20161128104420.kzbhlqvqcsjn2222@tarshish>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128104420.kzbhlqvqcsjn2222@tarshish>
Message-ID: <33EE2147-6A28-40BA-AFE1-3CD726389925@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 28 Nov 2016, at 11:44, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> Hi Damjan,
> 
> On Mon, Nov 28, 2016 at 11:32:31AM +0100, Damjan Marion wrote:
>> tvheadedend tracks version information based on git version
>> numbers. As tvheadend is downloaded as tarball form github
>> it was reporting version 0.0.0~unknown.
> 
> Having the version reported as v4.1-2345-g04ff649 is not all that helpful 
> either, since commit 04ff649 is quite far from v4.1 in terms of both commits 
> count and time. Broken version report should be fixed upstream, IMO.

Well, at least you know that it is 2345th commit after release 4.1 and that 
its commit id is 04ff649. This is much more information than ?0.0.0~unknown?
which buildroot compiled binary was reporting so far.

Damjan


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 1600 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161128/4834a63e/attachment.p7s>
