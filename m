From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 19 Jul 2011 14:39:32 +0200
Subject: [Buildroot] [PATCH 0 of 3] Add support for local package
 downloads (file://)
In-Reply-To: <20110315235428.1f50e78d@surf>
References: <patchbomb.1300174025@localhost6.localdomain6>
 <20110315235428.1f50e78d@surf>
Message-ID: <CAAXf6LUiuwOu9dj0_5EQLMkiJNk=DVErGiyEfwB+4xoLZO0hag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 15, 2011 at 11:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 15 Mar 2011 08:27:05 +0100
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
>
>> This patch series add support for file:// URLs for both the package
>> infrastructure, as for the BR2_PRIMARY_SITE and BR2_BACKUP_SITE
>> options. URLs starting with file:// will be handled by a plain 'cp'
>> instead of wget. A new SITE_METHOD 'file' is added. Documentation is
>> updated as well.
>>
>> Note that this is mainly useful in situations where developers
>> working on a project are sharing the same filesystem (e.g. disk,
>> NFS, ...), as typically is the case in corporate environments. In
>> that case, one may add one or more local project-specific packages,
>> and even use a central storage location as 'proxy' for package
>> downloads (using BR2_PRIMARY_SITE with a file:// URL).
>>
>> Signed-off-by: Thomas De Schampheleire
>> <thomas.de.schampheleire@gmail.com>
>
> I agree with the principle, I need to do a bit of testing before acking
> the patches.
>
> Thanks for this work!

Did you have some time to have a better look at these patches?

Thanks,
Thomas
