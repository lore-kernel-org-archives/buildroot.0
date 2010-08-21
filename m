From: Ossy <ossy1980@gmx.net>
Date: Sat, 21 Aug 2010 16:41:30 +0200
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <4C6C51CE.5020409@gmx.net>
References: <201007272333.09640.PeterHuewe@gmx.de>	<20100813122600.3d227eb3@surf>
	<4C6C51CE.5020409@gmx.net>
Message-ID: <4C6FE59A.8020306@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 18.08.2010 23:34, schrieb Ossy:
> Am 13.08.2010 12:26, schrieb Thomas Petazzoni:
>> This is fixed in my for-2010.08 branch, the specific commit being
>> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.08&id=fee182d20d9b1876436c9673744ae6312a40e889.
>>
>>
>> If you have the time to test this branch and report whether it also
>> fixes the problem for you, it'd be nice.
>
 > [host-zlib error]
>
The same patch applied, I ran into an error with expat today:
configure: error: no acceptable ld found in $PATH
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/expat-2.0.1/.stamp_configured] 
Fehler 1

After make flush; make the system build went on without problems.

Regards,
Marcus
