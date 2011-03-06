From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 6 Mar 2011 13:48:21 +0100
Subject: [Buildroot] [PATCH 0 of 2] Facilitate saving of configuration
 files for board developers
In-Reply-To: <AANLkTi=HTQ-3PGY+ohnKfM5nS66=tV-Y-PENE75CofOV@mail.gmail.com>
References: <patchbomb.1298817442@localhost6.localdomain6>
	<AANLkTi=HTQ-3PGY+ohnKfM5nS66=tV-Y-PENE75CofOV@mail.gmail.com>
Message-ID: <AANLkTinwOK-+fMFPh4cCsZreRnvVVSu-CYM9uuW1X=9F@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/28 Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
> 2011/2/27 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
>> This patch series intends to make the development life of board developers
>> working with buildroot easier, by providing two extra -update build targets
>> that copy over configuration files to their version-controlled counterparts.
>> The new targets, linux-update and config-update have the same behavior as
>> the already existing uclibc-update and busybox-update.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Great contribution! My thumbs-up for this patchset. :)
>

Thanks Daniel!

Do others have any comments regarding this patch series? Could it be
included in buildroot?

Thanks, Thomas
