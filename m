From: Ulf Samuelsson <ulfs@dof.se>
Date: Mon, 11 Dec 2006 11:48:07 +0100
Subject: [Buildroot] [patch] qtopia4
References: <20061211093336.GA11591@zelow.no> <20061211102408.GB20661@aon.at>
Message-ID: <026b01c71d12$e979a9f0$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Mon, Dec 11, 2006 at 10:33:36AM +0100, Thomas Lundquist wrote:
>>
>> Here is the qtopia4 package. opensourceversion tested on i386 and
>> commercial on arm.  svn diff againt todays trunk.
>>
>>
>> Thomas.
>
>> Index: package/Config.in
>> ===================================================================
>> --- package/Config.in (revision 16845)
>> +++ package/Config.in (working copy)
>> @@ -121,6 +121,7 @@
>> source "package/psmisc/Config.in"
>> source "package/python/Config.in"
>> source "package/qte/Config.in"
>> +source "package/qtopia4/Config.in"
>> source "package/raidtools/Config.in"
>> source "package/readline/Config.in"
>> source "package/rsync/Config.in"
>> Index: package/qtopia4/qconfig-myfile.h
>> ===================================================================
>> --- package/qtopia4/qconfig-myfile.h (revision 0)
>> +++ package/qtopia4/qconfig-myfile.h (revision 0)
>> @@ -0,0 +1,244 @@
>> +/****************************************************************************
>> +**
>> +** Copyright (C) 1992-2006 Trolltech ASA. All rights reserved.
>> +**
>> +** This file is part of the QtCore module of the Qt Toolkit.
>> +**
>> +** Licensees holding a valid Qt License Agreement may use this file
>> in +** accordance with the rights, responsibilities and obligations
>> +** contained therein.  Please consult your licensing agreement or
>> +** contact sales at trolltech.com if any conditions of this licensing
>> +** agreement are not clear to you.
>
> hm? buildroot is LGPL, AFAIK. I don't remember so have signed nor
> received any license-agreement with trolltech.. Furthermore, i'm
> convinced that i don't want to sign any license-agreement with
> trolltech ;)
>
> So what's the deal with this header? Do you have written permission to
> redistribute it under an LGPL compatible license?
>

If it is a file from Trolltech, then the "qtopia4.mk" could download the 
file.

Best Regards,
Ulf Samuelsson
