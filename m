From: Damjan Marion <damjan.marion@gmail.com>
Date: Mon, 28 Nov 2016 22:08:04 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: bump version to
 v4.1-2345 and fix version reporting
In-Reply-To: <20161128220315.1924903c@free-electrons.com>
References: <20161128103231.21626-1-damjan.marion@gmail.com>
 <20161128220315.1924903c@free-electrons.com>
Message-ID: <8D43E2E0-8E99-4D96-8323-E1F360077FD4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 28 Nov 2016, at 22:03, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Mon, 28 Nov 2016 11:32:31 +0100, Damjan Marion wrote:
>> tvheadedend tracks version information based on git version
>> numbers. As tvheadend is downloaded as tarball form github
>> it was reporting version 0.0.0~unknown.
>> 
>> Signed-off-by: Damjan Marion <damjan.marion@gmail.com>
> 
> Could you split the bump and the version fix reporting in two separate
> patches?

ack

> 
>> -TVHEADEND_VERSION = 50a370707aedf5c127e92bb517c378aa8ac04657
>> +TVHEADEND_VERSION = v4.1-2345-g04ff649
> 
> Please keep this as a full hash, like it used to be. It should still

May I ask for reason? Just for my curiosity...

> work fine with the version reporting, if you write this version to
> $(@D)/rpm/version, like you're doing below.

Are you suggesting here that tvheadend about page should just report 
?50a370707aedf5c127e92bb517c378aa8ac04657? as a version?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 1600 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161128/03c7d3df/attachment.p7s>
