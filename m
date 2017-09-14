From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 14 Sep 2017 17:35:02 +0200
Subject: [Buildroot] [PATCH] CHANGES: update after netsnmp changes
In-Reply-To: <20170914152151.qfxut4v3w4q7mwvt@tarshish>
References: <20170914125316.1872-1-julien.floret@6wind.com>
 <20170914152151.qfxut4v3w4q7mwvt@tarshish>
Message-ID: <CAHfJR7giZzQq7xrngOqn-wcstOTgvbm1Fi6=_Lcwh87+maTZqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-09-14 17:21 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Julien,
>
> On Thu, Sep 14, 2017 at 02:53:16PM +0200, Julien Floret wrote:
>> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Signed-off-by: Julien Floret <julien.floret@6wind.com>
>> ---
>>  CHANGES | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/CHANGES b/CHANGES
>> index c042bf5e3e6e..89d9e2a5fa95 100644
>> --- a/CHANGES
>> +++ b/CHANGES
>> @@ -1,3 +1,9 @@
>> +2017.11-rc1, To be released
>> +
>> +     netsnmp: all MIB files are now installed, making the target filesystem a
>> +     bit bigger than before. To remove unneeded MIBS, you should use a
>> +     post-build script.
>> +
>>  2017.08, Released September 1st, 2017
>>
>>       Minor fixes.
>
> This sort of documentation should go to the "Migrating from older Buildroot
> versions" section in the manual at docs/manual/migrating.txt.
>
> Usually only the maintainers update the CHANGES file.

Ah, OK ;) I didn't know about this file. It only seems to contain
serious backward incompatibilities, though; I'm not sure this change
would be relevant in there.
Thoughts?
