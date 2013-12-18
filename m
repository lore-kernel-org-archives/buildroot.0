From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:57:42 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <CAExDhvYZTKMaCvrFULU1EkV+RV+BKsvqP7hKJj4_WRwYnUYqwA@mail.gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
 <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
 <CAExDhvYZTKMaCvrFULU1EkV+RV+BKsvqP7hKJj4_WRwYnUYqwA@mail.gmail.com>
Message-ID: <CAAXf6LV+O5uTOtYjvjyN2OsoEAV=3EXCTv2jd6njb5SNqYYkLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thiago,

On Mon, Dec 16, 2013 at 1:55 PM, Thiago A. Corr?a
<thiago.correa@gmail.com> wrote:
> Hi Thomas,
>
> On Sat, Dec 14, 2013 at 9:52 AM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>>>
>>> [PATCHv3] QtSerialPort: new package
>>> Thiago Correa <thiago.correa@gmail.com>
>>> http://patchwork.ozlabs.org/patch/195057
>>
>
> I'm currently using this. Since then Qt5 has been integrated into
> buildroot and it includes this module. The difference (other than git
> hash) is that this patch compiles it for Qt4. We could drop assume
> code using QSerialPort will all be Qt5 or be ported to Qt5 eventually.

Thanks for the feedback.
To me (no qt expert) it sounds reasonable to drop the patch then and
only support Qt5.
Do others agree?

Thanks,
thomas
