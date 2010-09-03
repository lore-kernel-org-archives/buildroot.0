From: Mitch Davis <mjd+buildroot@afork.com>
Date: Fri, 3 Sep 2010 15:57:48 +1000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <AANLkTinkKu2UKogqR2fRE7Mk-ojEFkXy2MPqPHhW_jZC@mail.gmail.com>
References: <29591683.post@talk.nabble.com>
	<AANLkTinkKu2UKogqR2fRE7Mk-ojEFkXy2MPqPHhW_jZC@mail.gmail.com>
Message-ID: <AANLkTimfg5ifPQi4Wg8DXcf0tj9CS5wScGL7+WeH39Wo@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 3, 2010 at 3:56 PM, Mitch Davis <mjd+buildroot@afork.com> wrote:
>
> If you have to do it when the FS is mounted, you may want to remount
> it as read-write before you do the fsck:
>
> ?mount -o remount,ro /

Oops, I meant "read only", not "read-write".  Sorry for the confusion.

Mitch.
