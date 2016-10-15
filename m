From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 15 Oct 2016 12:42:53 +0200
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0
In-Reply-To: <20161015124045.74b4eddc@free-electrons.com>
References: <20161011125423.38125-1-Vincent.Riera@imgtec.com>
 <874m4eosfn.fsf@dell.be.48ers.dk>
 <20161015120504.2e88e2f7@free-electrons.com>
 <7938ab33-1e87-7374-35a0-7d5f4bf04072@imgtec.com>
 <20161015124045.74b4eddc@free-electrons.com>
Message-ID: <6b18a6cf-6b50-b31a-9dd5-4dc24a046a8f@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 15/10/16 12:40, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 15 Oct 2016 12:28:53 +0200, Vicente Olivert Riera wrote:
>
>> that COPYRIGHT file doesn't contain the old license text. It has been
>> updated since 9.10.4-P3 (previous version), and now it contains a text
>> that specifies the license is MPL 2.0:
>>
>> --------------
>> $ ~/bind-9.11.0 $ head -n5 COPYRIGHT
>>
>> Copyright (C) 1996-2016  Internet Systems Consortium, Inc. ("ISC")
>>
>> This Source Code Form is subject to the terms of the Mozilla Public
>> License, v. 2.0. If a copy of the MPL was not distributed with this
>> file, You can obtain one at http://mozilla.org/MPL/2.0/.
>> --------------
>>
>> Isn't that enough?
>
> Ah, right, I got confused by the string "ISC", which is also the name
> of a license, but here is the name of the organization.
>
> *However*, if you read this file, you see that parts of bind are not
> under MPL 2.0, but instead under some other BSD-like licenses, the
> OpenSSL license, etc. Shouldn't we take these into account as well ?

True, I'll send a patch to amend that.

Thanks,

Vincent

>
> Thomas
>
