From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Oct 2013 10:44:45 +0200
Subject: [Buildroot] [PATCH] kobs-ng: check Linux version for mtd enum
	redefine
In-Reply-To: <CAOxVtSTUG=bsv8WvfrH2WF5UwvG04w+YRJkH4QTN4YS_D3k_WA@mail.gmail.com>
References: <CAOxVtSRpiU5wOFJdzSMDtZvcCro583eugwroCu0BdYNaeYhu7A@mail.gmail.com>
 <CAAXf6LXhJCTSZ+CkFEhWuCpYBU1AmDNava6duSuLQ1mdpbVnCw@mail.gmail.com>
 <CAOxVtSTUG=bsv8WvfrH2WF5UwvG04w+YRJkH4QTN4YS_D3k_WA@mail.gmail.com>
Message-ID: <CAAXf6LUs7ekL17ea53VEAFhEx9qDUhGLPfbhd2RwQLsJgeMeUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 22, 2013 at 10:20 AM, Sergey Alyoshin <alyoshin.s@gmail.com> wrote:
> On Tue, Oct 22, 2013 at 10:38 AM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Take into account that patches in package/foo/ should be named
>> 'foo-0001-description.patch'.
>
> Is modified patch 'package/kobs-ng/kobs-ng-fix-mtd-defines.patch' file
> should be renamed to 'foo-0001-description.patch' style, or I should make
> new patch for the 'package/kobs-ng/kobs-ng-fix-mtd-defines.patch'?

I didn't realize that there already was a kobs-ng-fix-mtd-defines.patch, sorry.
Then there are actually two things that should happen:
1. rename the patch according to our convention:
package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
2. update the patch with your changes.

Both changes should be sent as a separate patch against buildroot
(meaning that we can apply it directly to a buildroot tree), either
created with git-format-patch+git-send-email (recommended), or
manually. The manual explains how to handle this:
http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot

Please let us know if something is unclear.

Best regards,
Thomas
